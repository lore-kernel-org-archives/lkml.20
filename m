Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433171;
	b=erYJktiTJGUTPokBNQMCEgH4d7/ZXL6/khkySKMCd3zOPE9WsNHrqJUG5Y/yAgs3wnhu
	 CvXKEJEpP7tgNXFjiiZrbTrioKExR39eokrfeQHB05V3cL2iX0XiIyKy71zB+LPqeA9jF
	 9mxUAcGYC6ydefAj6L2XSUvQNNzaLloW61yQQPwanE/HgKBWntwVQiqDHyrIaeyaUW5sa
	 N+zd5U5uZFnCzpIzBlMJzublmIlU5zNlhbdzoLN8vvjFGX03lpEBCCuh3wkzFNOAEWOVc
	 aK9iQrnneH5yzkPSio+t6KCSOuqqjx/2w7lxqV0pEAEWc+74SFJPSt39/I+rEp/P5RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NtixGAWabeXrduX02b/RotwSNJOMM5dvEH5fBuXsl/8=;
	b=m+YnC/GNU+pPPiHdq6fzGEmE/lPM6TzHlsNQTG8EdGSlWZ8ajMX+p94G+GV4lILWRqNU
	 ukN3fpdHDwHSujtXdVQCNHq1OGdwGcCJ47RDVzPOsHPzrklijN/T5j9dVEZtrDDfUBXFR
	 LQYTLVwEiuyspJoTJeOWDwaYWUF/O9GqEdbidoiXBuzH78NfbQ45Tr7bjOWQawgeTfCi3
	 g+cdyExsilDzsFTfzYhwJzjC5iRucnCQU5JqyqbaBP0Cm/c7QZmNIjkvdD08oyzeojloy
	 3dbL2A3dnsE5Sud6pWMsmMObIx8exjoY/pXzWxKV41sv+nifNpDizQErGHPWCXnx4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Z6r7q0nr;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0555606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0555606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Z6r7q0nr
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89f639ba307so778661b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792433169; x=1793037969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NtixGAWabeXrduX02b/RotwSNJOMM5dvEH5fBuXsl/8=;
        b=Z6r7q0nrFdPwifMRfwsDmnDJwU7pOs3vBXCX0MpPuDGAMdNTPF6LflBo+8KtkGwjwd
         Ay85MADOAn0cKzxpg8feVpoE6J+3JE9KSzgdihGs2hJ9FZqptuLvKofY/oa/kTGTaSic
         3Y0tFPdYGho7pYYpqKSRI62wvZRfHkwci6Pm4jfjfeZq40sb+2GT4DEK+YlAmGT9cVY9
         5m4zRuhS+3ylWmjgvFSN3yZmDtNqLGcrFFd5UxKN2Ig4j/GlhLfdrWmDtDNASISv1t7n
         5NDivHFx5cw/0hmC5+YsB0oj451+DVQO0HXFuaadY0OisS/v6+BC7ZVGnFTHIF1nWmww
         Pjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433169; x=1793037969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtixGAWabeXrduX02b/RotwSNJOMM5dvEH5fBuXsl/8=;
        b=lTfPu1WJ2kz3r8MSketbHsIQRrGKcZ5cSrBfTzEmmI8mTf4Doy4ZcKHG82AN7FFBH3
         LbY6FK223NJDaxF5DXCk4CH0gKclXwFStxgh3keAhfrNVRFIGZrg2H73eeEGeO9WiqOi
         BT/KZix6F6g6My1dbCTyBxP4w5B+Pkm0UBs5eygtBYoyGojUxMSf+RmOsgAOU/k8ZTGL
         Jk/52J3hDMX/p8YZWrF6GSZyctb64wq2rj28y5U7lBrN12JJ+75cOl55W9f655oGqiQT
         YSpHLJbLx0r+gh5r6M10SDQ3euXu7yGUiso4T0zsF0FteQ5vRivbxUeZc8iiRGyQmDWh
         whuA==
X-Forwarded-Encrypted: i=1; AKwUvByBfauUBEWX3tyMS2rg8ex4zQRtc6vcYREMpO2UM5+4xGsWLccAV6m82IxFjXbG7ISnEFWsmyjKHUSEMRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZo56FsUKGcjijRPFtLLneprytBDG7INuvKvvqTERXdBpSpI1b
	FUDQn/wpWdtIGGFMBhLZed5wxeExJAEePEgDHdu3+ukeA7Gsm1B+UcXllpsfWXkBP9Q=
X-Gm-Gg: AYBFou2iLDAAf8Yt24PDSIqCzovtaqnm3MLCl58qhw89ogL79sgl1NUVmA3jxG5kqFy
	psxVSKwzHSRVhpY9XN9dQSWP0EjUZAW/h2gnaCBy9/owQemr+pX6rrnU6IjCSKpFpAXNMt8+T2o
	YCc6UsCeY/gp+WG+PzD3TlcljaRiVvZ70VgSAizDACEqQcGnblHOGKYl8QpPtVnBvP2dhNFEBsJ
	vto9R4rnvZdXxTczNUV+kChZH0SNvd44OP5ZWwbG7OYY3JLtFTPSY+Fq/3A9yc9tW2gdECUl09/
	KeavDNK3/cU8Eqo44vjisC15NbeEDOSUWq21UHpbVSOZ51NJtYTc/zltAeAMXAS7ZCO4ok0RuHb
	5yWbfTA9gNfCoKeNZAI2hV/Ft58U8uL/bAEh3wfVVsi0VLFohoasCaI1QpMriQgDNsOi3Nlmx8a
	RbWBmoLr6xDMnySFlojwV1+UIUJKupKiMVOekcCrNzTCN8Tf9w1tspSaZfLt6gG+RvKKSqxiuNK
	gQ8/Sh3iazk/OogxLAiafc0izvdwkaSp0g7SC1NLU5EXVUL0/U0b+//ieF0EbzIiwhUq7dGFZAP
	390UrzEcCcDoUJBmAqbm4g==
X-Received: by 2002:a05:6a00:21ce:b0:874:706d:962a with SMTP id d2e1a72fcca58-8a04be43d00mr7042493b3a.28.1792433168948;
        Mon, 19 Oct 2026 11:06:08 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-89f57653ea9sm4184034b3a.32.2026.10.19.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:06:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:06:04 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 01/18] nvmet: Rapid Path Failure Recovery set
 controller identify fields
Message-ID: <20261019180604.GJ2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-2-mkhalfella@purestorage.com>
 <179206908475.1897932.6636243827945983905.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179206908475.1897932.6636243827945983905.b4-review@b4>

On Thu 2026-10-15 14:58:04 +0200, Daniel Wagner wrote:
> >   maximum number of in-progress controller reset operations. CCRL is
> >   hardcoded to 4 as recommended by TP8028.
> 
> The spec says at least 4. 

- CCRL (Cross-Controller Reset Limit): is an 8bit value that defines the
  maximum number of in-progress controller reset operations. CCRL is
  hardcoded to 4 because TP8028 recommended a value no less than 4.

Right, I updated the commit message to mention that recommendation.

> 
> > @@ -1695,6 +1699,11 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
> >  	}
> >  	ctrl->cntlid = ret;
> >  
> > +	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
> > +		ctrl->ciu = get_random_u8() ? : 1;
> > +		ctrl->cirn = get_random_u64();
> 
> While get_random_u64 is very unlikely to return 0, it still possible, thus
> 
>    get_random_u64() ? : 1;

Good point. Updated.

> 
> would be the safe choice. Besides this nitpicking:
> 
> Reviewed-by: Daniel Wagner <dwagner@suse.de>
> 
> -- 
> Daniel Wagner <wagi@kernel.org>
