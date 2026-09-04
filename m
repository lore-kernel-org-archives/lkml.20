Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0C4772B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520156; cv=none; b=ceicaIRn9uakReZElS7cdI6Lk9BkLEaousThZQjN9pE+aPrGD8bsOCfqUWQbTOPgZaNKT+7RQ3CA3qt0SPf2Bb24XJk5tMDFysIIBN8xmExSRyuCqHjyTk18c9P+eeRHFwCn+FeKbdFK8ZAgx9p0ITX4Xf3OBbWIOe2/GjyB70o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520156; c=relaxed/simple;
	bh=lJh/NV90iACtAKBRabXZVE6E0+jqYyGArt/IrFYqr+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ba8cNhTCefjfALzX/mlKfJHejzNYMkuX8KfwVYW0CVWONecjD54HPaaXmA1L6j//n1lZz2bfetDS4OqFVB7aOa8vI5swmNkCkda9K91/n2uG7Z09SKu8VmftSDlP1cYAWMe2NTUMKapONfXfkDVdgNb9dhOEcjm0qY98N5mMMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0EVe8n6; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0EVe8n6"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b37782d003so652582eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520152; x=1789124952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSaDss1c4tyLO1aJNg75LC2jBfZ+NbZc0L83zGAsFPA=;
        b=c0EVe8n6YFDrDuVf409m24e0aRUkthhuub0GWopzRGvjME4xYj3/x+R5ICtfoFHi2e
         qP8WuNfh1DHHSusXPN16n7BC7+3nwDl/mmQTUiQ58GcNaVsS0T++gLqOmADKW3woP1S3
         j41G1d/Ogqhot43fLrLCYLq/pTFZkFw1JTUuegpuNOdUxGAuRdYJLfqnhaVMJWQTfF/L
         uEjvKEb2Co/LVqG4S6cb/CyL5paH775XW1I/3QMY1RnsCIIRdbDK0a8GlPW9CQMt1Ca2
         JV4BLFICKECjf/w8t22mylIG95uMdvxaPYFb6Q0K+KVZWKNModAgAoePj56/TR3Ovtov
         OqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520152; x=1789124952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSaDss1c4tyLO1aJNg75LC2jBfZ+NbZc0L83zGAsFPA=;
        b=CiTl2WsnOiYpN+RLHZTiBcnYQg6cDFyLnmvn0Hyj22jbVgELK4bLEhYCz8JnSbNJpx
         IBXnNZSktSmj0HoadHhxftQZwIbOz32ptkmvLucv+ZdFSncIKMub50ahPrH22gvP/SqR
         AF4qWituX4MQwVObxxGOhb6fViWOf403fM72a4F6GkScfNJ64PlC3tXyfnSsbgX+N0xE
         4EA0GxOXblCMVAuzEIatmwngcxKCG9EHIUHYs5o7c9K3MVwlVYA45hWmFm7ixMnN6dLE
         zkM2cSowct2s/62hfm3JcEWPKUlCQNdssA2kU/6vCeRVeMcMnSwV+7Jnq3bZY4zYRiEN
         Rg2g==
X-Gm-Message-State: AFuF++l6+aw1MrCvsQhQQ7Ku5JLUSjshHl9lix3qjqeXvJ80y/oNgZ/f
	kA1wi38c05xIXnVoB9l0BxHFKX8z6lIZljQQDEW3b8/7Zqu1JD3lj1h+
X-Gm-Gg: AYBFou33kNWFvPfeamSNEmFHGllEFlSjmdO0pO6Y1F7VFU3ls6kT85ktm8MyTbTw3Xa
	D8w7il/6ZxyF29qkd/aFuZqV1KwqNjw+uclTNa4W0wNsF9bDwOa6+ZzxfjWFUNFksk7bJeg0jwO
	FFMfx3qwFMRL88NGSABeY9n1BtFmXUNtaa3LZKiDsVMdC9WPUqxoGZrgz6rfYnPbrhuSpOcP1x7
	MVD7athqMCUH68P2NngAj63ZPliGBBG++jmryOb1YgCGnjIr6SFjsOSJTVdZuzGkfpjRYZ3JpNi
	xB9ulIBa3cDIkfkeCYFzWNHV1GpvhngDkpDYWwwvSu1DdtKhUQcbswVwkcSQlygVGetmPZLXKVD
	HT0HLhTPSBSnpag8hVVV0LJ8ZvPjxl/YuorTOupdnQO8oUovT9kiTXizXUjjfXOpYtGibxrn/Z7
	0+eRP3Kr5YAQgTY14alRp7WXh6oIvcegonZBo6x39HuWFOz3+L7yO7DQngBQOzWuV9O1gK+QAij
	fs7UwviAvTtRziERkLlyxOqn3A=
X-Received: by 2002:a05:6820:61d:b0:6ac:a994:8794 with SMTP id 006d021491bc7-6b6fabe0728mr4455404eaf.7.1788520152161;
        Fri, 04 Sep 2026 04:09:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5599656eec.18.2026.09.04.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/2] platform/chrome: fix repeated word 'from' in comment
Date: Fri,  4 Sep 2026 16:38:58 +0530
Message-ID: <20260904110900.20435-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110900.20435-1-hemanth.selam@gmail.com>
References: <20260904110900.20435-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'from', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/chrome/cros_ec_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index 09bd9e49464e..7390c2c91ea5 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -20,7 +20,7 @@
 #define HOST_EVENT_MARK		2
 
 /**
- * struct cros_ec_rpmsg_response - rpmsg message format from from EC.
+ * struct cros_ec_rpmsg_response - rpmsg message format from EC.
  *
  * @type:	The type of message, should be either HOST_COMMAND_MARK or
  *		HOST_EVENT_MARK, representing that the message is a response to
-- 
2.48.1

