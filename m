Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007726;
	b=aoivQn6NX0r/BJ0oWAv+dGDwBaIZaUHKT0nAqbaWzifKyEw9kEZqU3ouXhKAyC/GQj3a
	 spygkNUURuDYK7Opp9UUCG3uZopCzKt1j5IkRP4q9f2b4r0GjZqT6whMJuaFgEC86pJ4W
	 FeZWSOUDwn0uLwABfsGR+VxFKuM/Yk5JmHXpF7b7JC7H7AEFsiSlQ9Cel7SOZFSf9xdQz
	 mAn1j//Px+hNb8IcYbInzSBljJsVwywpdz6wN7kIO1ZaB/JDwzMpSB+DEQw4TzUBHZI4/
	 StKEC5op5lKd7MtYrtf8D6wLr7A6o3P9jtNSoQi/u9Ywof0K0rVJqmE2eyiK46lBTNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Owt92U9/K297y9PboHuFVnZHHyIFy57q0eKvHeAnyg=;
	b=0AQbEtRfEQJVwmVSXTUeNr/+H3UI5VOoOVSocxK+Lwo4dzLZaRJR3IvAJuyRES0GdlM0
	 yGPnu/TdrbVGFnxJn7AjeCx0d6gfEmDFHZNrRzVbXYjURq61yJgFikZJcHeoWPyhyKOVD
	 FtjAmomeR90QgJf00Jib3LKjMwH3nOPFPta2QVABdsaf5Lf1In8wzGEv7x70zv8D6jijb
	 EbYft/0uXloP8enCQPazm+rQzhsz5rMd196GA9KlHGFuuPaC73bm5zEn/qjurREVKXz5F
	 6gv1oVQfQRRsHj7SQlGqLmVsIjo2b1egEqspgSYkge5bAi+T/cVG521Jz8TYPtXz2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=FT3qLASn;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2486606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2486606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=FT3qLASn
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so679729a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794007725; x=1794612525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Owt92U9/K297y9PboHuFVnZHHyIFy57q0eKvHeAnyg=;
        b=FT3qLASnVzV2WkcjaX4fdn5pExpQa2aPIoICyH7HJcCgDJhoKHRKPnkqy3pfCM92Sz
         XrWxGI1XuggIzkunX6YXWHYVdIxzKz3wpEpEDEoKR1Vu0AnIV3DtJ27ClBpUhi2XBw1L
         SAW3B4URVCNC/VyXGQnobGy5TYxKKpHfB+Q6+WAuEldmafVCe2GSmAvwCuYHqfJ7q0w1
         OENfvn/lTsssfQz4AQTAI371aHjQTrmN1Uzoy8K60rhO3smeUkG/4QI3zbGpxuCD2Y4O
         tfMahpU+yjmKtI/aahOU9kepOVa0+zJZ8/W4BhQnsIDcLZdYU8FPOvKoysZOcJ5wIaY3
         y4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007725; x=1794612525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Owt92U9/K297y9PboHuFVnZHHyIFy57q0eKvHeAnyg=;
        b=yaoDj7FTCzcGUeJLuw7yhUgKzeOCZVLi9aPVMgMK4z+KwcRMa7iCO9kQnlcFQ8sZn8
         tMsJNlz1dQvi3kzWHNO3ODiUolH2X4GBFWqYdY0Nu5mkUMI86aCJrQx4EcAv0qEJAPw/
         +BcvZowVUqndSlOFMrMm7mSydeuJlnJed8/HWkgViboxISl+CZ8OjUPCPKnLRbnOPbvH
         oeSbGOwS8qHOaA1LCFvMCxh+dBQvLg/uDHy42yEGEfAln1FQoPQltn3rnGrZi8M7/Czz
         qTRInll2NEPWfn2r0tvBDAHR3vFCldVS0QjmVR/lSmHUXsKlRgZQMHUY7LzIbYAfjlsK
         0rEw==
X-Forwarded-Encrypted: i=1; AL+hErEkI5P0GGg8LHpR1Zq7/blaa1N5Wq+Z/QdTeEpKfoNPsLwwvWqn73e4HIFjU+Xt4cRZEBj1NWvx9U4PozQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D+94xue3hZeGFqfYslCykVoYOC8RQhr+OaNBkUmRsTRy5l5Y7
	43DnN4S+nQIgw1c3+aKj/CdhFlNAIRVhJy5819LSa0P31MTdgKoo+S95ai2/UQnjbgL7lVj8osR
	ZV2A7dxcm8js+5RU8s460UNdvY9+TrEPd1PAH
X-Gm-Gg: AYBFou3PWuoVumBogSvBnYm/22oUdbO/bXQEUVY6/FN3rmLE1Szw4Ylqads3oCp1iMp
	aPCpblV01lftpkTfBnfzBth6aGKhJ7MJbKGULcdF6zAmNDFDd1VF28lEE/c42ydqo7pFOAtD5zO
	WEc2xFsOPhrtoZFVBLzx2ueF4MUqWSexTqNk3hWSaVnIvOVqPOPg8vIgNMzHVDa9vyXAS9YFPV9
	S5OZOe5rZb/dyjNt23Y2w+SU6mW/SEsxUi6GhPfgYMfk9YFT321It/go3J7IuW45wYaIC3s3ddi
	3JeSIQjGhWANjYkxkc8wIlCdEXXwS4ahexM3i3SeXa6+Lbw+1UShB97xZdhJD+Ep1lL/ZnmxJin
	ahquSStQatOmtT+yn/rNRCVKJwgzY8TuvpxZBvpg=
X-Received: by 2002:a17:90b:5107:b0:3b0:ce1c:e74f with SMTP id 98e67ed59e1d1-3b0db6ee67bmr3731051a91.27.1794007724872;
        Fri, 06 Nov 2026 15:28:44 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1057a07e4sm394446a91.2.2026.11.06.15.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:28:44 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 4D12234039C;
	Fri,  6 Nov 2026 15:28:44 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: trondmy@kernel.org,
	anna@kernel.org
Cc: cel@kernel.org,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	jlayton@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	slingappa@everpuredata.com
Subject: [PATCH v3 2/2] NFSv4/flexfiles: limit transport disconnects when cancelling I/O
Date: Fri,  6 Nov 2026 23:28:43 +0000
Message-ID: <20261106232844.2176820-3-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106232844.2176820-1-tmenninger@everpuredata.com>
References: <20261106232844.2176820-1-tmenninger@everpuredata.com>
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

ff_layout_cancel_io() cancels RPC tasks associated with a recalled or
revoked layout segment. If any matching tasks are found, it then calls
rpc_clnt_disconnect().

rpc_clnt_disconnect() disconnects every transport attached to the RPC
client. A data server client can have multiple transports, while the
cancelled requests may have used only a subset of them. Cancelling I/O
for one layout segment can therefore disrupt unrelated I/O using other
transports belonging to the same data server client.

This is particularly disruptive with RPC/RDMA during data server
recovery, where unnecessary transport disconnects can result in repeated
reconnect activity on otherwise unaffected connections.

Use rpc_cancel_tasks_and_disconnect() instead. Matching tasks are still
cancelled, but only matching requests belonging to that client that
remain on the transport transmit or receive queues are marked for
disconnect. When such a request is released, SUNRPC conditionally
disconnects the connection generation on which that request was sent.

This preserves cancellation and draining of I/O associated with the
layout segment without disconnecting unrelated transports attached to
the same RPC client.

Fixes: b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is recalled or revoked")
Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
 fs/nfs/flexfilelayout/flexfilelayout.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout/flexfilelayout.c
index 4419ded8fe586..5c289737366f2 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -2611,10 +2611,9 @@ static void ff_layout_cancel_io(struct pnfs_layout_segment *lseg,
 			clnt = ds_clp->cl_rpcclient;
 			if (!clnt)
 				goto next;
-			if (!rpc_cancel_tasks(clnt, -ECANCELED,
-					      ff_layout_match_io, lseg))
-				goto next;
-			rpc_clnt_disconnect(clnt);
+			rpc_cancel_tasks_and_disconnect(clnt, -ECANCELED,
+							ff_layout_match_io,
+							lseg);
 next:
 			nfs4_ff_layout_put_deviceid(mirror_ds);
 		}
-- 
2.53.0

