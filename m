Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36A55C32D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095914; cv=none; b=YiL54yCB82dNbgPCh7Lp+/TXfCPHm5sMJrFmHc/A2Jve5O/tZFb0DebApJvZll0Hi17MRaW2V8rnRlhT5+NLIdufXQtMdS2iCHVPqZ81ZCLjq/SxA11ubYBDr9Eb204C3VdtthWcy25458s9ynKrJ+TOIwdr8jBiL9UwfLw5f1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095914; c=relaxed/simple;
	bh=JR8UUrkb751uoe8c+kx7f/pcFn3yD3phw1+0bnRVD9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=truatctCISuWRH5P6DdalnA9WgMhQySTl7jr+1AVanQZD8n4CQeeE5Ai4HeOZnbXWhOjPBNcPBL+reKUpN7qMq8KGZmpbFTZCBvMwFMtWzjs1ggxfrCgNc7lhvhs2wuTWGTqNoHUxvspeql4DhFYUAKgQYQ0ufunM2uGQvjwPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=n+3QEbvm; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="n+3QEbvm"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6fe4372c5f3so1062494eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1792095912; x=1792700712; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FasFmG3+u/YJgr74y+uX/0QTIZ4D+65+ggHRPMtqahQ=;
        b=n+3QEbvmW8iOhA44DqJHBF+Tjx07bELG4BcCaQbPaO1x7xToltuNEPLSDAVf2d5o46
         WrxZrNGc0iOY4Xn141jNuEm/dYnUvrwmOR88e0srPDO+H1kxAQ/F/Wf8OSQncd5eNXWy
         E1doCBACtqdQSh+okRBWhS51RN6pUz7JYj1j8i82P3GVDBDa5pW5Nqfkt5hXRNNS20wH
         P7jxkk2/rageWh0DpBDQ6zpzZl6HMwNUrLIaHkDQxWVb5t+FL0HBaqFMHOgEO5VK559V
         aU2u1ys7f6yJQW6TzjzSeSTzCl3senbabfvk94d5Qf0D1DR+73/G+QF93HEopukd5ztS
         TQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095912; x=1792700712;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FasFmG3+u/YJgr74y+uX/0QTIZ4D+65+ggHRPMtqahQ=;
        b=2J4gSsOx7Q64ghHOxJwxLbtkJueGKRzaLju2eL4vpX9s2HreCIQETlzV1r+vWFpsIa
         /7s2vrQJqYStvBRTb+1IHfsY2brObtbx+6bwPYgfaR9izRkn+pMK6G+Bw9XVyP32SoN6
         OYRaGiYiwkZzFggP7NFoAVuNKApywQ1Z1Yx7A2RUiVQ3uGG+mMXF/q9Gman6AQSfOZeP
         CSddCtlMNaYkPmvBbWT+OCoFjw9PmoT/VBmFL0RZ/FV3CSWs6Nw2fgV7U7sJglhZ1DbJ
         OTrsbIKnJEPtJQ6xiv6XG8pdSYBrkAIHV6f8q7VQUe629XwrrihmRxomIl1QNGH8D/rZ
         h16A==
X-Forwarded-Encrypted: i=1; AKwUvBwliGdQdVHUNIHVTpu3uqroLIhRMkluIUwzFLN4Dy8FeeJHCPlq2D9C8BeS/DsngxD55DXC8jgF1o0LZho=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy+yw8thEZsRzTeoPEF0nQWFKipnCKC/B3bq0LnJzSZbMzptbR
	UXC7W1r9Hr5UPVNvpJiWeQQvqR2l+wbM94pxHWjyKdSOLfqNNK0jGPdGkN/DOB4SM10=
X-Gm-Gg: AYBFou3RMAAmAPnE1FW75TdW5Y2l/OuX5zLjei7lHh9caHSzxFAXeKKR/GFhgbzRwtT
	QJrtBVHEcpPeSGQxWoFFbeG5vnlADRiIqlBBd1AcyIxBL8t3gEDehL3KXBmzXEr5l3Oy0YM00YN
	uTAlbWwkeWzSjHrumCeFMclrgdqIlgNhnkYdu1qdzj7qAOk5xKrKlUcAGdq0hjPzMg41LjKTb6Y
	B5Qoug5H0kSyrAOk4A0y/QZUOf2mLW5Vf+xqVzoDC6tZ1fnwUNBSrIPN5JcRg4KPX7V5XTnNb2j
	CWBOsUR5ZcBs4hPmT+LKgcp93VJ21kwOYlG14AxwuK4toaJeHpE9oGDOXaghgcW3hXjVRUL7P0+
	6ML1xi8raK9alZLyVt6/v8R5tBG+0ZqzUu/Z9IKpu2Hy47uy9FutJRcMoP+wjDVhYluPgiQ8rtS
	pjg2ToBJs3PDm6ym2BZrYgKhVBntc2yI5gSfT6BSf4cwgOwaXC1qZn/glbVeeRMRiWIRNblXQZO
	uDjU++HV6v/Uwp4z54xcVq05l3yMA==
X-Received: by 2002:a05:6820:4dca:b0:6d9:1628:7b7c with SMTP id 006d021491bc7-6ef10a7fa4dmr15620136eaf.82.1792095911989;
        Thu, 15 Oct 2026 13:25:11 -0700 (PDT)
Received: from [192.168.254.51] ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12dfasm100050a34.24.2026.10.15.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:25:11 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
X-Google-Original-From: Benjamin Coddington <bcodding@hammerspace.com>
To: Daejun Park <daejun7.park@samsung.com>
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Christoph Hellwig <hch@lst.de>, Benjamin Coddington <bcodding@redhat.com>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] nfsd: layout recall and lease break fixes
Date: Thu, 15 Oct 2026 16:25:09 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <5E58C7FF-4202-4F10-BAB7-B027292AD070@hammerspace.com>
In-Reply-To: <20261015-nfsd-layout-recall-v3-0-ba3269f8ca22@samsung.com>
References: <20261015-nfsd-layout-recall-v3-0-ba3269f8ca22@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 15 Oct 2026, at 0:15, Daejun Park via B4 Relay wrote:

> nfsd polls a client that has accepted a CB_LAYOUTRECALL by sending the
> callback again every 10 ms, with the stateid of the first callback. A
> Linux client from v6.8 on answers the repeat with NFS4ERR_OLD_STATEID,
> and nfsd takes that as a failed recall. So a client that needs more than
> 10 ms to return a layout has the layout revoked and the fence path run.
> With the block layout that client loses data it has written and synced,
> with the SCSI layout it is cut off from the device.

[...]

Patch 5's point that the Linux client doesn't report NFS4ERR_BADLAYOUT
on LAYOUTCOMMIT - nfs4_layoutcommit_done() throws it away, so fsync()
returns 0 while the block layout writes into unwritten extents are gone.  I
think thats reachable today through the existing recall failure path, so
it would be a client bug - I'm going to see if I can fix that.

Otherwise, this looks good to me.  For the series:

Reviewed-by: Benjamin Coddington <bcodding@hammerspace.com>

Ben
