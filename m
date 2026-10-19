Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6AA4078F0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412523; cv=none; b=Ib+k6dMHEzOPs4ixbc9VZqnblxf+8LyjYCzoi/6fEcWWhDonGBJRFkh6fEDQkrzI6/QE2Neyh080jXRJdpw60mtofADS8uSZoHAoYsfl4ewIrz795/fXqmA6h6/0LV3HYOq9QjtRLMsPjb6JaJLU7/jttly6u8H0UPhDTYa5kIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412523; c=relaxed/simple;
	bh=sIALCuzmK5MrLm1WN32r3MHvew38w9LvE/9jWk8EGbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQCapBEjTayHZr3HKM3CRC6bu6n0Tnr7lhCB6ra2AhfF1kI2KjQNy7cji6bLEOqNFUGTqsCVWqLuWEz3CF+w3y1qB+lMC8Ysm4M9bs/w2Wm6rH6zDV86b15MpKP8MZjKKXe1YQ28Bv6rC7vIaDxHrbvK0m+tZoqvw4Tl68qi3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmMZhS7h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hn2UTZuq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmMZhS7h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hn2UTZuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792412519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HvmVJ/YjUjexXZFkRD2KfE4ivd3D2olHrXzSUsWnuRc=;
	b=JmMZhS7hZmJBYb1DykQwGhZV7Sf8AZg1sXTM5QOUcaXmdk/kIjX7KJ1GhZepPBNI0DJtlY
	qJOuRv31DdzRY4g66WRe6nO9nErWPWOzHOiM200rFCO4Jd7GCnyppbh5MJYWywdPx0wQL0
	wuZvIngm7JEWOqjWAvkXhZtIGcj1zPY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-9te1MOTeMzCGy6CuUjr2NQ-1; Mon, 19 Oct 2026 12:21:58 +0000
X-MC-Unique: 9te1MOTeMzCGy6CuUjr2NQ-1
X-Mimecast-MFC-AGG-ID: 9te1MOTeMzCGy6CuUjr2NQ_1792412517
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so15031605e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792412517; x=1793017317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvmVJ/YjUjexXZFkRD2KfE4ivd3D2olHrXzSUsWnuRc=;
        b=Hn2UTZuqWEZkLdA2pIQ01wivh+pndnJt8zrb9dilGsk4xCcjNxYQJqeZN+3A0aYbKt
         2XYsGslsm6vlqPtHIXNN73mcHdqzHiH1hqfDSGzMIo/4LhGYUSI5FRU/Gkca053996cx
         JIDfTb2qm9IS4lrF33QdLjeNiY3tQvEg0E+URHicm2tGcStigJSwU5p0nnmfwjo6v1Vr
         50M3P06aECYEmcCNJGma7otg6u/lcvvdlMNpNU2lw32dYOL2LW2Zxip+FMzQ177S3HB7
         FV7jA0Tpu18aPcv811z/b1Pv8QS1GOu7CBJRTduID8xyEJ5jFrfdPWZGjV9oXutBbTYF
         PmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412517; x=1793017317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvmVJ/YjUjexXZFkRD2KfE4ivd3D2olHrXzSUsWnuRc=;
        b=ltOMubgHaXCSsJd7PhyADynxcz3zaqz5MlyvjZNFOIzk5cXnY2e7iaPhaQJVY9PBft
         3xaNoyDrlDgHaOyARxXikr5PgymkxXD+CdARO+VxT1SmT/fVZ+HHsEUuM3JgYa4oLMWR
         /ScZuXALOXf1AgxTuJFlEAJjP1+ybP3xNT3hN10WchWCsglkbPHWkaXplHro48MfGpvR
         zdfkKG4UO5yRrqdvliTA6iSNcdASGGgZXyxfYfjNpGlujZGddWPCzeeVxQO5Ev5n8KQ1
         Gcs78htv5NqXFfWVhg4K40zIBjOhflwRhzQ+hfNGpr53jvkCa3rdNRZ3aNKb68aF/EUy
         kRzQ==
X-Gm-Message-State: AFq9FYL9t0SaK2QPyRqIeCfdlNs/jSv6/7TPCCFwnstM1Rl7aDvbuMPr
	dX4hgF0QRdrpwHMTa+62hMAnvkdHaRQN0nTFw41BCRVV8RQmfQASwwbClz80p/bedc4b2+Y78zH
	k5jdkMhsU2a/VXg4s3svmxRuBJrweOAOp+ct2V9NL0ColOD46ziXVofW9OF7pNzxxkA==
X-Gm-Gg: AYBFou21pVFooGqR2Zt3N2Qc3krOIXNbMh1zzpdY7nFPhqYI4j49droSMVxcGfhoXsE
	UeeLzMujhB4T44fHl5SFLJ64HD0hNsPRji5fiMyGsowkWn+TsA9SpUn3fF3OCkZah4k8zz44i0x
	5wKRko47F2K7aPcahPElmDciOKxm8x2aYqrEe5Vph/9V++HPKp+7caZYtWZNVlhRzgWZ1m9XcEK
	Rxu0pd1hzYi7eN4BPtI/Nj8uR5qg+QQ3lqCeowo8Z3VlYAbBKfXbmyQAJ5rtdVRlOKIZcNWdokk
	cDTcHnNz7A6OCz6cubkoLslp0oUgvc0PwSHeY1iw8SN9fBdiGYu0netU6/3M4oZc8oPGgg==
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr177431485e9.19.1792412517082;
        Mon, 19 Oct 2026 05:21:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr177430755e9.19.1792412516569;
        Mon, 19 Oct 2026 05:21:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm524058155e9.1.2026.10.19.05.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:21:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:21:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: netdev-bot+sinfo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH net v3 0/8] more virtio-net csum hardening
Message-ID: <20261019081218-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <179241175916.3290.3107334544259481724@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179241175916.3290.3107334544259481724@kernel.org>

On Mon, Oct 19, 2026 at 12:09:19PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

To answer the question, the virtio header is checked at input by
Eric's patch. I'm not aware of a way to bypass that, but given
the amount of pain and work this is causing, it seems prudent
to validate at several levels.

Patch 4 is a bugfix - i reproduced it easily but it is not normally
encountered in the field - the combination is non practical.

-- 
MST

