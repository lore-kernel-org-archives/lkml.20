Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632026;
	b=DY7FIZti1GYs422f+b6bGjDpnKL2mLnm1GK/DNZNVOHZY9b5GPCqNGKuCKLkETTC1QiC
	 RJe8a5YmbDbKwcbNO56FA+ovg4Eo3hRHcIt7b+oa7mr9U7FBscXjA97z69l47+u8hoz1K
	 aTC1g9kBg/TrHYb8JWfSsogSkDVSpKQVt2tDIeP2rsuIGBy/z7UaAydVbghXHGWoPq/LN
	 ymR2AhvjsaeDgKlfUrjvo8Lism+dHuILw8tPI3OSseJqfU3Xu1MlMbSWgzMM/EQstnSDl
	 ZJy3/V9oQN1umUqioGdEuW7pDhW+f/j92zAaJaVz6Odt5SmAj23r0n8zrkut9ooNG4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dylFydTJD2AJSyC001lOFTgMCOP2ZnGzBFoGx74ahLY=;
	b=TtJfzP9y4dnlPXHgRdyeqvuUwqgMtWpx+DU86fGyHTNza3IxvSm17zIRh1epyUe6eTwL
	 karmsEy//aGv2RVXLbnBeG9UGnkeRcNVxJ/XrKbRGGksIU06OGyvSrzWEM0fJ8E75/u2o
	 KsxMK6yQmWEFsSCmB65+lPNhf4JNzLGyb9gpmULqLhYpzxHRT50pGNgr23JEgE6KHV2Zw
	 E/VULj9mpBJwfyWG9mgoVEinoyJ8G8b2PMeOkaYANHY1X+I/El68TVvSSe70jVUhIu/rn
	 pVTXKekVuFS7ua6TsplfhSvBSe7lcRCq/oxokXRUa5c+ullbV7uHShDcmNANwJzJzug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIFPv+69;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BDE6072286
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BDE6072286
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIFPv+69
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so24097295e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632024; x=1794236824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dylFydTJD2AJSyC001lOFTgMCOP2ZnGzBFoGx74ahLY=;
        b=wIFPv+694wyrg9+1XM8aOK8Wx39dCR+nB6fK+nMApN+7HUpoJctTfpVbDN4G/0e6Gf
         Ah5qfgFWxlmfXMnQSLEI/YRxyDPVKlJm2VSdx0MUI2IzTjd6MYmWs4odw6r+1RqvJ111
         oyjvS/JGjcAYvxtCDBjClRA54yveUkLx9JixEtSNtDW+n4MlrlTKOTULAgm7yUGXv8bO
         XjBFEs/aMJzunIzvTdeb8KX2sTiZseANC1TpH2dObLB+5tib4H3Jdz64+38hMxYSDkSX
         hVCkE2V0tU8fxfUcNr4jlbsmSuX0dMWkdJhcqFM5DX/xalEWo0VTvPyie618MiG85XnR
         wWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632024; x=1794236824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dylFydTJD2AJSyC001lOFTgMCOP2ZnGzBFoGx74ahLY=;
        b=ANyfNhdO0d9o9kZ3vKvyks41Eeilozq1odni9X+4E8T+rNH3efx8bDJoNDBRcjcNVO
         njegC4I4FlTLVA05P4Osd9M6gUHcNQS2WheSWkouDZ1XrV1PtAzZlryecGR6twDyYzX6
         6WSdUGKytAjYIzf1Iev3DvhW0Oih3XGSBOsAioB18KF8fOJz8fdSrsLROntWpf1OddAb
         OlFykyPqek+zhcbCzxliKdVD+vYhurlwgp0eoPaLDMO/TKC9aXjH+og1NsEHULQwaT6u
         DaSRqDHDTFbjpnLOIICfbrnmqis1W5jrfDvO/bFDCKbqk28MkYXB0kUGLuRZrEI6pXnp
         TQeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzTYnDGGETwQF/qLFYQBwm4Ugmk5ZUbeC8jWtTNBTAOFHWkE0Ri/ufk4bg7ShHDSk2ZIz0frpYsBovMOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVCgG8Smd5HiSDFaK4E2CCm0TR/457m1PJ6yuLul4SaA9QAnmI
	rpbsfq88bfxoMeGFd43pAcfnrXWyu88c0VgTmmndmS26RjDY9OY8STaR
X-Gm-Gg: AYBFou2mXhUh9qjk4heX5pA6Hd57/1EWwwPXsahc/G4g9sHMO9lG2bYLDBdzIrQZyer
	kwHtEQqKbE1ZUyA4JI0e8aLFWh8jO3RjeqoO0kVfdsaNmxLjRD0kBOk7mejDP2zxQSpNI9b3qIM
	d+0vSmGsx//YN6H6R8wqYz69YJ9OxuE9Tggzv5CBrw8m8NJFhRJtiGRtR6YCJhmRHrDsPR6yPdm
	JoXW3cJHOtcckB0LXFtDgslGYPf1EU2qRXNT72q8xB9nsMtxCwe4Bdp1OLg3Bc1YYHO/G1S5XV3
	KaM9v84CMSNL0tYPYwMH0u2MNrbroT+zDrDKATQ0yInt3/X4pzq5ISuV5RvmNjOOE4iD02C4rxu
	N7FJHSowRpx8EvOWI2traxRlbMq+Bm3gpEa6jw+vY7G/bgzkKsgvWGc5bPiAWqNmGL1+fVKN9+4
	T2QcOlaLJwgygsCRdDOlzysANR1NCnUt6+MKHR9fjcmcldpLUjNpyo9UABcloOFTuTS8pJFecvR
	DAVhvgBXZ7hMSCpiHv0+QM7/2WEXPQhyOv+oDDSB6cywDu5UxhCiGYZIOhQzlz/wNBxM51r2eGa
	3VyghmddgH2sCMSJUO15IQ3GwVRmrzx/wjTKvurCO0iNIA==
X-Received: by 2002:a05:600c:1f8d:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ac177539f6mr227554115e9.17.1793632024294;
        Mon, 02 Nov 2026 07:07:04 -0800 (PST)
Received: from localhost.localdomain ([2800:810:84a:dc6d:d32b:1515:b2a9:c74e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm395629535e9.11.2026.11.02.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:07:03 -0800 (PST)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	netfs@lists.linux.dev
Cc: Shyam Prasad N <sprasad@microsoft.com>,
	Steve French <stfrench@microsoft.com>,
	linux-fsdevel@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH netfs v2 0/2] preserve prepare_write errno across write reissue
Date: Mon,  2 Nov 2026 12:06:53 -0300
Message-ID: <20261102150656.207612-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028181229.1408342-1-ivanrwcm25@gmail.com>
References: <20261028181229.1408342-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cifs (and others) may fail in prepare_write() with
netfs_prepare_write_failed() before write_retry calls
netfs_reissue_write().  Since 82e8885bd763, reissue clears
subreq->error to 0 for a clean I/O retry, so a FAILED subreq is
terminated with 0.  The collector then does mapping_set_error(0),
which is a no-op — writeback errno is lost (not an infinite retry).

Patch 1 skips that clear when FAILED is already set.
Patch 2 adds a KUnit stub test: FAIL unpatched, PASS patched.

  ./tools/testing/kunit/kunit.py run --kunitconfig=fs/netfs/.kunitconfig \
	netfs_reissue_write*

Changes in v2:
- KUnit: allocate netfs_io_request / netfs_io_subrequest with
  kunit_kzalloc() to fix ARM allyesconfig -Wframe-larger-than=
  (kernel test robot).

No prior lore report found for this interaction; surfaces on top of
Shyam's NEED_RETRY change.

Cc: David Howells <dhowells@redhat.com>
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: Shyam Prasad N <sprasad@microsoft.com>
Cc: Steve French <stfrench@microsoft.com>
Cc: netfs@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-cifs@vger.kernel.org


Iván Ezequiel Rodriguez (2):
  netfs: preserve prepare_write errno on reissue
  netfs: add KUnit coverage for reissue prepare_write errno

 fs/netfs/.kunitconfig          |  3 ++
 fs/netfs/Kconfig               |  9 ++++
 fs/netfs/Makefile              |  2 +
 fs/netfs/write_collect.c       |  4 ++
 fs/netfs/write_issue.c         |  4 +-
 fs/netfs/write_reissue_kunit.c | 80 ++++++++++++++++++++++++++++++++++
 6 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 fs/netfs/.kunitconfig
 create mode 100644 fs/netfs/write_reissue_kunit.c

-- 
2.43.0

