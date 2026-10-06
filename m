Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667B04ACC74
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791329592; cv=none; b=Q+Rey7WrkDDZ1GEoz/7nM0qy+sWd6siwk3m/UFs1v97XYiZS0D9Aa5Ypw+d+3s+SABdri4U3pwuz6abp0a/bZyx1efG/qBdEIN+FEOuOaP9TsYozSQS3wSSHEW238Olx6Ww8VDgFYqpwIKBAjt2T0WUduA+0l8M1X0iSGZwTAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791329592; c=relaxed/simple;
	bh=jeh8wX1VtM8rIztS1mGHGilDl1cowvi7CkMOJho//9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tOkf/UTU5GEkNIByTEaAN+0AzNgtDTjYiiFjb09O/GMLmlMAfU88fLKs8Uuy5NKLJU77neN9Mi/x2KgdgHPM+fjhfDjCe7ZySn2tEkCAg0NxFtfUpuvBm9wgqKd2PcTUPaPOrzvlSP7rcUouhc8jQsIsot2wCSybAnjv66Vw4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VdtbWuDA; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VdtbWuDA"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so2894835a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791329591; x=1791934391; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6upXy1ggiAmqRn8NzAPWCi+VBffm0mcFL33X4iCEF+M=;
        b=VdtbWuDAr0QAZhJjWAvENo+r7eEE8Ko6rX13d+fSRMAzhMMefhMEXPc84N5s6QKL0C
         31/WefkyE6rp3yOAuqdkfD2Ai7dn35WWNG6368TjLwCIyo4wXlYmNhOgdyDfft5PrZri
         5XkeRCxBBB0ITKgUTrAZfLrsvySbZCC8L/nxuxRofO6PuiQr8fPk7338ByD8/h1pJsxH
         NHfXKnFOzez0sWHNwq7DugNkewjR7MgITCSDiSqYv9+1dna+k+M+VjtQB6eaWVmUzlPe
         /oXNhTMM03yRf73tweBF43zXkOMAXTlXuBM0USED7oIQYDCLfHBDGvIBnN4vpFbT7DEC
         6FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329591; x=1791934391;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6upXy1ggiAmqRn8NzAPWCi+VBffm0mcFL33X4iCEF+M=;
        b=JfmMPcOjilD0PVsDyPp38Na4taz2GUx1Kgji6zXMMR+IkHyOFZ+1xRSMDwTXqQ5K5q
         8J2dWD/tYJMcIwBfF+5IM6NRQ8U5oC2FtLm2I3OMV42crXMfnxGqn2fsMQUVhrGq9NRp
         ozBVaP9EFLPNIaxi3HZr+O7M0bfmpGuq4PBwmkTO05fX4v8UAFAnb3IdzLJGlR1mZC7d
         wkuTTzvBRVl/1KVpN3z9hxq/ZTwbqLsuEOW3LkbbGVJRHs5iOS6qkvzZV3prOmQAKQIr
         EWA7jmY+Equ3Z72V0ZzmOBVtPM5p+RvmkB46zRzQ0vcQ6zFIngTy3aqk8gt8fRSl7a5K
         tCKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDScfEC50jvrsqSfUz+7Ep/lbNdn46JLXbvFIVlPvySTmV3r4joTKS3hCOnJ/WmSqEoP+IrtYJ2GGLtTU=@vger.kernel.org
X-Gm-Message-State: AFuF++kcVnMNThhMfkicasf5dwGCrOjLsL9uq9J6iHwcRLNA/pudoEmf
	uFC9N41mUfTsIiphOSWWxbtM7Uahke9vmQoQlImPOx4GBLoprLov6fwi+zXnL+0QwVkAGOavpM1
	e4Q==
X-Received: from pgej2.prod.google.com ([2002:a05:6a02:5402:b0:cc7:d4f0:846d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6012:b0:3e0:f4a9:3615
 with SMTP id adf61e73a8af0-3e1341549e5mr399754637.54.1791329590656; Tue, 06
 Oct 2026 16:33:10 -0700 (PDT)
Date: Tue,  6 Oct 2026 23:32:46 +0000
In-Reply-To: <20261006233248.705086-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261006233248.705086-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006233248.705086-7-praan@google.com>
Subject: [RFC PATCH v1 6/8] nfs: refuse P2PDMA pages with krb5i and krb5p
From: Pranjal Shrivastava <praan@google.com>
To: linux-nfs@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Shivaji Kant <shivajikant@google.com>, Tom Talpey <tom@talpey.com>, 
	Leon Romanovsky <leon@kernel.org>, Unnati Sachan <unnatisachan@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

krb5i checksums and krb5p encrypts the payload via CPU accesses
while the RPC is encoded, before the transport can refuse it.

Fail such READs and WRITEs with -EREMOTEIO in nfs_pgio_prepare(),
before encoding. Check the task's RPC client, which for a WRITE may
be the krb5i client that SP4_MACH_CRED swaps in.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 fs/nfs/pagelist.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
index 3ec4e1e5fe1f..ec535ed3051d 100644
--- a/fs/nfs/pagelist.c
+++ b/fs/nfs/pagelist.c
@@ -771,6 +771,14 @@ static void nfs_pgio_prepare(struct rpc_task *task, void *calldata)
 {
 	struct nfs_pgio_header *hdr = calldata;
 	int err;
+
+	/* P2PDMA payloads move only by DMA */
+	if (hdr->args.p2pdma &&
+	    test_bit(RPCAUTH_AUTH_DATATOUCH,
+		     &task->tk_client->cl_auth->au_flags)) {
+		rpc_exit(task, -EREMOTEIO);
+		return;
+	}
 	err = NFS_PROTO(hdr->inode)->pgio_rpc_prepare(task, hdr);
 	if (err)
 		rpc_exit(task, err);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

