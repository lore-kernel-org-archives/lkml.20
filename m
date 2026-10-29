Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308534;
	b=R3KA2uT9FTrbD/2VH/FDstK/rIEak1w1+2gVcwHM1XST8Jc6T2ECwj/Fei9AmUyGgZ/O
	 jIPBmLbo4imSV3pabauskHYieTd1Ydr2VKk30yzSlapA8Yp7m3jJhWbh6ONHULBPg+eax
	 hzn1os6jbacKgmop5Pbxkd/0Eb5AHmkg95wqBPnRfqMFIl5HP2g9s+WgBboM08FbZOVAq
	 cPsWRLAPW69QuB0pmHSB2QGgX3ku1Q/VgdupoHHbJsjOQRFcmVxOi3GYlShvNvyYObnBT
	 ea67ddN8Vd6jRshX852fs/BX9rrpncHhU/wn6xbjy+c50ht9ScVYoppVDS6x9kj+ZmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308534;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=rbgA2NhQmBBCynjtJFMb9J9STofHj6wgPgbtpbZIb+k=;
	b=1TmlnFTXGI+GJFLICW6KRhyLWckgYnfgBL5B3jssoxnePv+Mcnua82am5Hfjq7/iUEFP
	 XMOuvp+X73KVJWGWTN6pPe8WRKdIbgCBOiU6npDY2TUxrAHsf6+3wLJpcP+9IT9Kecyt8
	 DWkfA4eUCRXCyi99Wgm+p9/1tYmq3cdQR/ihpmO07r0DLflk6tMPwg8soWA/UNJUiqNt3
	 V69eS9X0BCMB1QFMlsBn/ssxptPneSxDMDZPFEh99J7Cwlb2itz9pVkE8sICgw1XZGKn3
	 8K1TMl7HQ7kfuN5/Dz6EdRrhLfnRHA2uoDZTbnBsdPeRYyZpiZMwNMTy/vpDPrAbjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JAk9Xw7v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JAk9Xw7v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793308533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbgA2NhQmBBCynjtJFMb9J9STofHj6wgPgbtpbZIb+k=;
	b=JAk9Xw7vPd7zRa+YMjOOjxm8AG9z3YwJ2+IekC+8f5i/zAC7SBNfv+MLmBuzGLIXS0rXRP
	m/vkY+JbUvvtj8LLw7EPECw5PFa+uga368yIMeCowxJw/0ZQEViCeanicRZZEw3PGFWppB
	tsn9j7SzIpeLGiEkiKC3twhYaR0gNP8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-dZYdjsAJNVi28d-0caQj-A-1; Thu,
 29 Oct 2026 17:15:29 -0400
X-MC-Unique: dZYdjsAJNVi28d-0caQj-A-1
X-Mimecast-MFC-AGG-ID: dZYdjsAJNVi28d-0caQj-A_1793308527
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 597B51800BEE;
	Thu, 29 Oct 2026 21:15:27 +0000 (UTC)
Received: from [100.91.223.109] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C2821955E7D;
	Thu, 29 Oct 2026 21:15:25 +0000 (UTC)
Message-ID: <f79de58b-5a3c-4b78-81d0-0e7e50adca15@redhat.com>
Date: Thu, 29 Oct 2026 17:15:24 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: qedf: Remove unesseary function call
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Nimal Prabudoss I <nprabudo@redhat.com>,
 GR-ETH-Storage-Upstream@marvell.com, Jesse Taube <jtaubepe@redhat.com>
References: <20261029160443.904468-1-jtaubepe@redhat.com>
Content-Language: en-US
From: John Meneghini <jmeneghi@redhat.com>
Organization: RHEL Core Storge Team
In-Reply-To: <20261029160443.904468-1-jtaubepe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Reviewed-by: John Meneghini <jmeneghi@redhat.com>

Nilesh or Manish now that you are on the MAINTAINERS list for this file, can we get an ACK from you?

I really want Martin to merge this so we can move forward with some of these bugs, and he needs your ACK.

Thanks,

/John

On 10/29/26 12:04, Jesse Taube wrote:
> The result of `skb_transport_header` was unused. Calling this function
> warned when `skb_transport_header_was_set` returned false causing a
> panic on debug kernels.
> 
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
> ---
>   drivers/scsi/qedf/qedf_main.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
> index da429b3a4283..f2bc0ac684e0 100644
> --- a/drivers/scsi/qedf/qedf_main.c
> +++ b/drivers/scsi/qedf/qedf_main.c
> @@ -2496,7 +2496,6 @@ static void qedf_recv_frame(struct qedf_ctx *qedf,
>   
>   	/* Pull the header */
>   	hp = (struct fcoe_hdr *)skb->data;
> -	fh = (struct fc_frame_header *) skb_transport_header(skb);
>   	skb_pull(skb, sizeof(struct fcoe_hdr));
>   	fr_len = skb->len - sizeof(struct fcoe_crc_eof);
>   

