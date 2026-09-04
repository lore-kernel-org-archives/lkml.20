Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0603E448D14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520869; cv=none; b=k82BuIwFjY9DQEy29L179SmEdtRk5l/yAi8RmHqm8Bb3e3y+dDqHCRd/YtNJqkdwMWMRhTh0DLYtwea9iOImta5amWADWAm5eO1S6Ia0r3bmoQ7NkvXn34DuVquviwXrIDKVD9w1fqc6AQIw+fXCsNt5hJxZgXRfDqeQbYIyzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520869; c=relaxed/simple;
	bh=YHUSWncJG4kn/isoSLhwcXwtOQwWDC1msBJis3Ldk2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knuwCXvjH3PXppHTcyY77UhfOjqEGnTrjfZ4inVoBhCQ/m4R8pbKxccOtZuvy+3w6wGUU40qYhJxnPQ+U3lSRrcyGCclIM5qyV2Fx0pjf5tAOzp44nu4LD7dzVplPnB9JfpgNxsl77ksXyJ4UGE3xTEfaQHD+PIrBKD5ckLpPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9SYetot; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9SYetot"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d5cad1a6baso7845475ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520867; x=1789125667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnTyvksY7pfKvaenvyNkrisVTNLge2aOUQRRsR1U+eg=;
        b=A9SYetotE2Um2CEQf4OJi5hBvWpfc+jXsYZfH79TRbhGS6r5mfJ5M2DRjj6WJrl2zE
         r9frymriwQ5Cy2YIu+Xx0DbdZdJvzxOkigwqlYLHHV6pwjwVBkG6r6vP91lPD1qiJU35
         pfZRuoWltvJhBfVLF4SedtlaEkE4AIFYCRNNFcbww/y164FLOOCbGJC152hBX/lKwLvo
         yTdWJwU+rd6Pm9dwjhwEdFPGqdohfP3sr8Ze9UY4f1P18p+AY6xqdHchpcO58BAmfowQ
         lvl0AGde0JNdulkrTdvqHRlXLueZEGg0Vq0yPrgzrReCcxg4g+S9jkZjO9dy8K/lcvyV
         kHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520867; x=1789125667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnTyvksY7pfKvaenvyNkrisVTNLge2aOUQRRsR1U+eg=;
        b=jzqdbVIqUJsJV/gx0r7He6ilT9z0xp7L0MlEktuVRMgwHz/W3s25cfkuaYY58pPBy9
         xPQDdYEMqtmxjx2z2u8fjmQkzolqFaeXYiFfXiC1vs67BZ8xp3kCZymODWXlsa9feh4m
         lVncrmpooPAu9/0NfGdwRdbPZy7RJux5yAxlT1oXzlZ/I/bYjddGEE2IT2JPTBh5uXWt
         R3fTOKsf8cLU0Aq03cbmFO8/yk/bFFu/XJOH0dL9I+6UaeysWF1RCYZwS3030sTfXSpQ
         cKCWyUJceq6u98eiCzQ+6frnaWoo0MTHzTk9oJQeBCkIy1XSc22xf33mgbla76ZnPgDY
         Ej3w==
X-Gm-Message-State: AFuF++kl/Tfn8UXoNJq8Pmn3SdGnDkLvkDt5XEjTuvddgn3fciNlEKCa
	EbifA+zp7oYZewRm3lpgTEOW5rwOwBl1JY49dYH5srvBs2NsniQ+yQl24saQe6JV
X-Gm-Gg: AYBFou2DMv6i7n9mO6NTreecS1O2aaxm2nggamV5/741s8dqq/R4cDXgMwWce0e5LvN
	Uq46p+3TvpRst1uP+AjQf2OaJm/li0wo1f135gLnf4FSYu10lG+grse0ZaeGBhpbL6W+A0/Me7z
	MYV6lkacMQTWJ5xNyb2TJXjCrPrAVP3VAoj1raY11vWCFd86JWj7jKU6b5HssR4aExe+/Ol3AK+
	am2TbrgpZACCw5GkBUNG7rE6OLm79bYBwr4ShkJESTMEJhjqPatBnUc22IIwP8PU32hPZd9TOpc
	DmdidMsZ+H/oPKWNSVn2dzzYSNbnTx5RGIBf3vIXaAHSIrxRtkJKbIlyvr4Wy9nxnognrC1FFJ2
	nj81R/yEWf63kKyvaQkH/AYjeJM5AzqzW1vlUhkA+tdiC4L4z4vZilkFA0NXxhZ0xCRrAZUNrcO
	IIHV5LiNy7U/0byvIp32PDgsYE56ukLkZHrwg53U6dBTfYzDyw1eF5r4hhCTjPoWufC8Apa6fJM
	uMliMskY/7VaSE=
X-Received: by 2002:a17:90b:2e4b:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39b26151b89mr8733669a91.6.1788520867353;
        Fri, 04 Sep 2026 04:21:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm5805929c88.0.2026.09.04.04.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:21:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	v9fs@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH] net: fix typos in comments
Date: Fri,  4 Sep 2026 16:50:59 +0530
Message-ID: <20260904112100.34541-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/net/9p/9p.h     | 2 +-
 include/net/9p/client.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/9p/9p.h b/include/net/9p/9p.h
index fd7a034b8278..22ab7486795d 100644
--- a/include/net/9p/9p.h
+++ b/include/net/9p/9p.h
@@ -120,7 +120,7 @@ void _p9_debug(enum p9_debug_flags level, const char *func,
  * @P9_RCREATE: response with file access information
  * @P9_TREAD: request to transfer data from a file or directory
  * @P9_RREAD: response with data requested
- * @P9_TWRITE: reuqest to transfer data to a file
+ * @P9_TWRITE: request to transfer data to a file
  * @P9_RWRITE: response with out much data was transferred to file
  * @P9_TCLUNK: forget about a handle to an entity within the file system
  * @P9_RCLUNK: response when server has forgotten about the handle
diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index 55c6cb54bd25..f3aead8939ef 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -97,7 +97,7 @@ struct p9_req_t {
  * @proto_version: 9P protocol version to use
  * @trans_mod: module API instantiated with this client
  * @status: connection state
- * @trans: tranport instance state and API
+ * @trans: transport instance state and API
  * @fids: All active FID handles
  * @reqs: All active requests.
  * @name: node name used as client id
-- 
2.48.1

