Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550270;
	b=CmOZUV+KwMgPcYT8ISWaVIFIQc2mjmyMUs6AWAEwVYC6ha5ATHntwc8CJCxhbu1ST004
	 nd3JGj4keEvQX9C7L5Wl66yYM//UpeNizKp0mXSt/LE7yvPlXzZIPJVdKFEkxDYAYBo8V
	 ADdK22Vpu0ABC7dF1lx1cI/zKG+cMTRcjv86rhUfrw83JWSY19WHjoHkhY20E/zhJTi+T
	 KlCcu2TAU10+THI8o9sOiKcNrBa//L4U9v4yln2jqFof8VftGtdAMYVxfMvsidcbtvlfd
	 B7fB47t5RwaujjmYx4zmP33r9zwIjPCx2M4jc5T+2oEV3M6DmTT18tw2KN/tDUwoTWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FpZc+8ubBDCMtZDWxsPNubFaGS3JiUnCD4SYOTvBTss=;
	b=Gzb2mz5W5m/f9GDh+sWKWlOSHnoA7pbowhoCnTAvhLI34zxRNFgX6RlpCXKHbeZLnXja
	 A5+Eg/nzLKWSnkXKoPSZqeNZft1lMpAHwWEVi7w2RLtE60JJttOtzEbEvubbXGI4Y57wf
	 Cw3ZBCUq3yBpV8TAyTfiSYl2ipsJcw+3uMXxw4so1saX0ZOvf08ng/S+9EGksk6FqEC/d
	 nNbWp+lwFIJudMhgQf71kmOv9YVOCYoED4pnJKb/IifHIXiNc4V2P2Qv6qECcvVQisdIb
	 sU8jrRVcSi77/2XWuIagzhxBPSxSy7pUaVy9VyFOHYJi8RViwxNf6k8ZIE4KMxuTqvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d4WGkEtg;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA69606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d4WGkEtg
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so457241c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792550268; x=1793155068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpZc+8ubBDCMtZDWxsPNubFaGS3JiUnCD4SYOTvBTss=;
        b=d4WGkEtgYjT9FPw0LenT848WVmz+lD49zl4yFoDt52v8dcjTxUqHJgFpBoCCF+cbSL
         1sVOgxl3LyhJmrLTz8mStV9YgsY1y4HVRuEyz6JdZO6sriJ7/YD2H4J4gHJ7/Syk76Q3
         IWZDGvIoagyBI5YBwadFMJWJG1H+MDupQYuV5F9gTmGf0mOfBqNicE0QUHRS2BwPi7Tl
         p5uKJJcOvXN49HhlkcXoOGpQNPUNNH5iwzBX+9WuSXSkOxIZ74HckdS8OmQ0PMQLWlKw
         kDYUk3xzE1tBZcjxQeOyzwIxaVNhPaBOJSothLf17jeVAntebHESTOuWvHA4vwt52mip
         tgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550268; x=1793155068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpZc+8ubBDCMtZDWxsPNubFaGS3JiUnCD4SYOTvBTss=;
        b=MDxmmNsd6TOq36kKyE3b8n5Q2ua/5nQGUyDC7MWJ7zQzPhgw/P5Dw73yZUi+GLze2L
         AxtZKTcM5qFcvdHDXWun42v94nadw3HPu1mu7k5I2HuW5vOT8FF7gqcz070orrLUY++c
         JP+JvqiqqzQWqP3rRvp2sZpNB2SnljzOb3R7/D9obVe+wnz5Wg5vR4LrkDQhaHgVWj2m
         xHXstCFvdkuhpr2c2Iu9rBbiXuQt7BaUBQcmAJtAdVdxJk+PWIK5a/5+AyLDmHXQzjht
         7yynJai8BY8seq3+OM7VFHuQ/JVNk2phpIFMo9LgGIle+iZTL0QcrGAh+FdHPQ6jgLif
         v9TA==
X-Forwarded-Encrypted: i=1; AKwUvByp+7UK0wK88jK5HQzDk/teCnADiJfqoyo3STDDUwJKeTW2QH9M7Iw65MO6RKWKpzRQHDU5OhhjhMnRAzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuPinpx4h3UJDs14tumwW/uQaNscz6KrOpUhn4TbBLFgjxRPF/
	FJdLePE8nbfhgKjI4Zl/MmDhTLNghjLb4dtq/B3gA9nt6HkLayoMvCMn
X-Gm-Gg: AYBFou1GEEVux32We9jCClcYx6DairPVUo0FWSMXtI2UT6wbFkEW4Nft+RSnsAhVyKQ
	5sSGKxeG308z0u55eP1pP8oLsUw2S5+attf6Rdcl86Ixk1eS3qdgoZnsLvXC/gE84bOFtVn02II
	aCE20zQ0HhyEUtndMo44OBr7UM4rPiNY7x/NQAw2NnOZ/3xIskcYM/80keZk7I0KwSMxIAGZxih
	KtQmqX6fwdAMJcaKZOKXDkdVfPsmmm9uE51eIz84HEVlBf4oQa5TNn0ObtpSqU2dvOgV05evb7O
	GOGtkkKfmhJnJZWQbjiMFzsh8IMtvQXzcXfDeGEhBU7Z0XTlxgk4QTBdgL9JdO98LLwAcmabFiu
	4QnD+63S82bSstYNe+oC7rvcuOQaujF4yJuMUXKa9E5V2Q0zPjJFqn6RPKtmJB21tyvxkU4fI92
	6VVDTK51+xvhMegmpc7orCbdPwYRAVuVtOVo2TxheeRQpRnygyk7D8lIOJX9qI68jPjqnmKa62X
	GUMXe55dh0sy6JHhMWYVlvwnUMreChc/CuRECPByYi2nQxB/94L/Anawa6FD7Fellv4byeQkg8T
	25rv36I9Usa9UtQgYvg3Gy0t64OEvNqCC5fWJpdZqlQ=
X-Received: by 2002:a05:7022:6613:b0:151:d6e5:596b with SMTP id a92af1059eb24-190a4f064ddmr1285033c88.9.1792550268259;
        Tue, 20 Oct 2026 19:37:48 -0700 (PDT)
Received: from muumthf.localdomain ([123.215.20.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm3354183c88.12.2026.10.20.19.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:37:47 -0700 (PDT)
From: Hyunsol Mun <muumthf@gmail.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	bobtobabz@gmail.com
Subject: [PATCH] nfsd: truncate LISTXATTRS replies on error
Date: Wed, 21 Oct 2026 11:37:15 +0900
Message-ID: <20261021023715.315727-1-muumthf@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd4_encode_listxattrs() reserves 12 bytes for the reply cookie and
array count before it starts encoding attribute names. If the first user
attribute name does not fit in the client's maxcount, the encoder returns
NFS4ERR_TOOSMALL without initializing the reservation.

The generic COMPOUND encoder does not truncate replies for this error, so
the reserved bytes are transmitted after the operation status and can
disclose stale reply-buffer contents.

Save the XDR length on entry and restore it whenever the LISTXATTRS
encoder returns an error. This also discards partial output from other
errors after encoding has started.

Validation used nfsd-testing b4e06bef3884. On the unpatched x86_64
kernel, all 1,000 NFS4ERR_TOOSMALL replies contained the extra 12-byte
body. The leaked windows reconstructed another client's exact session ID
and enabled cached OPEN replay, stateid use, creation of a new session
for the victim client, and callback-state modification.

With this patch, two runs totaling 2,000 NFS4ERR_TOOSMALL replies
contained no extra body or leak window, so session reconstruction
failed. The victim's cached OPEN completed normally in both runs.

A patched-kernel smoke run also completed a successful LISTXATTRS
through an NFSv4.2 mount. NFSv4.2 and NFSv3 read/write/unmount tests
passed. All test kernels built with GCC 13.3 and CONFIG_WERROR, and no
kernel warning, Oops, or panic occurred. The reproducer and complete
logs are available privately on request.

The vulnerability research and validation were conducted by members of
the Tobabz team as part of the Best of the Best 15th program.

Fixes: 23e50fe3a5e6 ("nfsd: implement the xattr functions and en/decode logic")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hyunsol Mun <muumthf@gmail.com>
---
 fs/nfsd/nfs4xdr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index c4fd840da4d9..c7c2be555b59 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -6438,6 +6438,7 @@ nfsd4_encode_listxattrs(struct nfsd4_compoundres *resp, __be32 nfserr,
 {
 	struct nfsd4_listxattrs *listxattrs = &u->listxattrs;
 	struct xdr_stream *xdr = resp->xdr;
+	unsigned int starting_len = xdr->buf->len;
 	u32 cookie_offset, count_offset, eof;
 	u32 left, xdrleft, slen, count;
 	u32 xdrlen, offset;
@@ -6545,6 +6546,8 @@ nfsd4_encode_listxattrs(struct nfsd4_compoundres *resp, __be32 nfserr,
 out:
 	if (listxattrs->lsxa_len)
 		kvfree(listxattrs->lsxa_buf);
+	if (status)
+		xdr_truncate_encode(xdr, starting_len);
 	return status;
 }
 

base-commit: b4e06bef38843c8b909d0b4317dfaaf87dba6d72
-- 
2.50.1 (Apple Git-155)

