Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709563921F6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239057; cv=none; b=dDPHRZXdbjukMe/VUXiV3BXXb/pawOfuWV3v+5Knw0G0OUaQoRDYjpJZICAfzDMpM0yCSD8MhhEhTc26vudmbe2ESYUNzd3RVlZUQUpG/2VD9k7Ht4pBvPhLvxjRXHPymQI+YA2bpGCGXaGSb3rPOPgl3gQAXxcoAsuQOGoULf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239057; c=relaxed/simple;
	bh=SuxtXn6NNfYNeCL5GoacBUALbJcu0En0PIos5uUWi04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0hoqc7jpLDLdixFXYL9Dk6OyiJwrK75Hb3nx706RCbB/fEuR8B/opUb0ta1gN+afnG48Ruiy1EliUma85jf5eekzCBkqJzaroNPyyCbHxCu2HxmDfVi1I4xpc3dkQK5pUt8XTqg7AhlTnMmNLP6N0AE/b7Jr6mF3YWSUABlxQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lpwcs2Fz; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lpwcs2Fz"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1215110a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239056; x=1791843856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMssj16PgkKUVxMr5qLJzo5w87xxnZ4aEogpVf3ihGk=;
        b=Lpwcs2Fz5mwF37GZWS09Z1jLs/9t068i7w1N6wL3U2DO1S3/Z2eKlj4/F8FRHDrcXo
         pUbQV6ZR1Tthve5bAuyY/Hc27GBbaOQrmYVsQE+iLFq7rAdQ0QXxN33Iwh7B1fFme6Re
         +l3s5jRW9MevQeRT1JvZ0wWcKc1se1pyyMhgjv37wYtzUwkVnerG1BCyPqyvxm94Rn7q
         4P/zoPeyJ6OLNMyUEco3ZsKwVqxMnAMnOUGEc5sqPWv2N0QX8g5bor7dUxx1DrXNNzul
         IwGyjENnSaWNzxbh4pywBS3GIHuRcpVrz0q6X6p7PyLbThOUOtkMyCB8Z5+XwaomDlg2
         nOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239056; x=1791843856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMssj16PgkKUVxMr5qLJzo5w87xxnZ4aEogpVf3ihGk=;
        b=JrQ07vWrTxib34XxK94NsaACrcxrCnH07hpEKSZmUMNBp0Z42DJMuD1IVuWa3Qqh+c
         9CbYLsAwqxPrtXUq0GTmd4u3K4AP3ZNQ56Biba9KaMAJhq5lXHf128E5sAjkKLfgIxtR
         E3V8fwcIJwEqUpY/JVydmbmFmDe1MuprUnxMpTk/c+QtAJXutmu346qu6drWOnl/QQ20
         yFId+JsogiZxhhxuuGFLKWRAY+/mB3pQPPuSGSaoyaB13ftwVgwyztpKFixU853v5CYQ
         UFvSYvPWq9XL/Bd2dOWrYrfdKi+MrlpVeMif/Mn1fhrYXimvNhbrCzbIMXo/1IdZ404m
         ptMA==
X-Forwarded-Encrypted: i=1; AKwUvBxV3+dLTO8G5Q/Q59TPjbiNW3ouZt3Bis9+RS0wGJCNiFyG4fAKW+cibRyM8UiNlDjXlUZzXojjCyCdM4I=@vger.kernel.org
X-Gm-Message-State: AFuF++n2UjQh9GNsniDq+YP0XBvlmgksSZp9xbTlbEvZlF6gp+a1afKS
	BNPJDvGtxQvM6D5ogDWC9Qo+R/62ZD3uRRW36K1ufoV4AoDeHomJxbZC
X-Gm-Gg: AYBFou3WHITA1LKwJBoxKHWAZpytDy24eaY0V7h7Wm54SdxRBM4SUrESmVbeYnXXgVT
	itLS5S3ttN/+Cfqmzw7Nd6h/lgWNzy8LzWru/04PdFelyAz1SF5UHEutArvE2VgCVKQZPuDuNgC
	F4IV+jaD+N9tWddSlmVXf+5/HN35H1RQsMwCMSY7Pm3VonFHqAqIxCDYpaUnCyaIkp5t8RIjF2N
	rhoiQMvAsCwFGkCRxKGzoTZF6JQFgbdPlAc+k3zUvML5/FOqejNMN1Jb2PCcHvk66HB145nS9FJ
	sdnaE5JPmaaj9j//y9k8bZaDvTSoh4hwWw1iRSrssMwLYglNSmiFZaLr7BLTri5QEQjNUfOhwuY
	4BLOHPHaxXmq1Sf4ZBxmeZiz1rxkK/FRqqMJoXAoaWHScCseIVG7ugK+Hu/imjF1pjEojFI5z+Z
	aDC6u/0sNVI7plBvM1a7i9Hs371dABtOhj80MXopiu9kYDVl5U85DrK3gXrwRWdZVQah/53KZfE
	OY=
X-Received: by 2002:a05:6a00:2d17:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-88af24904c9mr11670252b3a.8.1791239055736;
        Mon, 05 Oct 2026 15:24:15 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4d::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f7daesm3853656b3a.20.2026.10.05.15.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:24:15 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:24:07 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Kaifeng Wang <kaifengw@google.com>
Cc: netdev@vger.kernel.org, almasrymina@google.com, edumazet@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: devmem: check uid and netns in
 net_devmem_get_binding()
Message-ID: <asQjgIENFJGh2rSl@devvm7509.cco0.facebook.com>
References: <20261005210403.3206872-1-kaifengw@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005210403.3206872-1-kaifengw@google.com>

On 10/05, Kaifeng Wang wrote:
> NETDEV_CMD_BIND_TX is unprivileged, and dmabuf binding IDs are allocated
> from a single global xarray. Currently net_devmem_get_binding() looks up
> the binding by ID without checking whether the sending socket belongs to
> the same user or network namespace that created the binding.
> 
> Record the creating netlink socket's network namespace and UID on the
> binding, and verify both in net_devmem_get_binding() before checking the
> route destination device. Return -EINVAL on mismatch so callers cannot
> distinguish non-existent IDs from bindings owned by other users.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Signed-off-by: Kaifeng Wang <kaifengw@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
