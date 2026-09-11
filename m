Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9F2F7F07
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087958; cv=none; b=ZcQZu6jjjdp+xJVFfwiBzeBXcSEkcg4EBfj9yRHHPnqZB9+TBafglrRZ0TxUCuyPFJRuRtc29vuf2LALpdxIisU9Tcr+gSrnxMmr7bi99St5sTgSvaI+W62bBeIBENv+XJMHF2yyl+wkFCLf3gwsbk0sgQwWIoxlRuFm3mMCCkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087958; c=relaxed/simple;
	bh=BQwhpDXzKhlCLOD2afisIUCnbjz9JJ1EqqAaObvs5Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcYusbROUsjWT4L0G7xUQaHXI3e5FWzS5BW8xZ4XwjkCwlLF7mSmLOWZgIXkypZPTBD1Z+uLWmNHB9lMshqBWs8b9OQ1Kg/Izbh5qREa2zSGTb/F77SB7Nz9cfOaiVtXvsi76doQfvJz1jGDKnwo0C2bVaBLFqfLgwc8PUyqcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBX9KeOt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBX9KeOt"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso2551475ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789087955; x=1789692755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jBly9NASd9J69NDrsbFKmvoK4r9VuFsqJ2PKUMl518Y=;
        b=ZBX9KeOt2lUFbN6TnbzRVMZfrdoeZ2a/Y7GvH/KqKOPjHrmqYIHAQ3YAGKm0sa2vzk
         0AHAc1VX5ycw/s9zlWAfzDuqSAipWV1DywWaiABdXm9FoTF7HNGwyUwOfGgLZNTwgez3
         KuyfKdeH1q/Oam4EHg6cbmzLztl7cabH634bJJ3+yAfSJMdX6F3thQRPmfjaH5jkikD1
         g6N4YN8XlQjsf72EuePZyjeYrI+F8LEwlCBufLNTlNTd7vjnTLkqAR/XI7/eC4wpUMMA
         SfDYryrAXG8ayzQW1qpZwoFARB98lkMYYCkMaadfOwnjRJz0k7txreiOuzZCQQhWg1ZP
         IvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087955; x=1789692755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBly9NASd9J69NDrsbFKmvoK4r9VuFsqJ2PKUMl518Y=;
        b=D2OA91Q7dXpc+s1Sh2nAOOp+wEJ+XVIExkBSdvUcgyUFRwzovHjpUj1vNvhmMjEgTz
         N5iGpvm6hT8AmLNupqVKcvj6eGCg9tZp7q17tazZGKwa6l96c22zQhX1F8544Lpnxo0s
         g/sziX4QQAQkiQvorvZDb7OojDmf90F718kXvcbehI9fVVVmHMYddX2v2n9hOoYXjmlU
         M50aWWrcuSh0W20iZjRneCASb9/9c5fDI8SqA+g/yYeY6yxxO/cTui9+Qnr+O4npjt6l
         cF9HZlqBddfk/FpL0egWQVGXbkuzorUg/C1esGtfDDlxH1qh7GN2wt7vHRkx36nqwSxa
         xzRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRTDwg54GfVILERrQ7Shkkl7+BCKqJzXtEW08culu2TltGb/fcqppCVFirEjfprDKYIJnfMEVM4YozmaI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZAGJxUtLUc1LUqgyeCc8QQD6GAPsaNKFuWBjiNK+1zAw47SyP
	L+NfYCnd1o6U8U9atMSa7nTIsHTbffRQ72gDfirzS7fAOcb4Waxx+wLz
X-Gm-Gg: AYBFou0jFmEihL0L5Szs6CD4YSHWZCid7kWP8blus60Gv73bCD4R3wsAShMiKKwgLEt
	HMpUIej1SYCuFRmMvZWJo8ImSSxJO8a91her7IXGstHbphZxr+aoZd0ObLQ+u+dQGSBRYv1Areb
	Mv/xlErsRkC0s4ZY7ME91vZ+aaF7bm8bRmdYnksXxlOOOhLelREdpjSAHubTKJXwhuVnvfqw6VF
	YcGdXOF6ZSqzY6pz+Z6p46RenXNz7f5ylZ4dkLS/pzWOnl+GwdphPI3EJ3unGdVmSKahd3EOvkL
	ZQemrj4s1EWlC44HgsWoGg+fXH4S2rxBybGYMiyW9/3td8w6h/YM/oykQKj2Nasp36JyuaFEVS/
	inoewK87CILDziJwj6KGEpG5VV6aXzj+FoZIOu+Nd2KH42GN84M1EyjW3s/wJSH4nCrG8rQpfma
	0PVTTmwaZqBJ8GHoc6dAbGVzMwiAnO8Ai7XuXtG8Mu6yYR7yQUXIM9M1vqu29lgB4DGYc6/j3Rj
	sN2DKTtwnJd
X-Received: by 2002:a17:90b:574b:b0:39d:985b:4274 with SMTP id 98e67ed59e1d1-39d9bc66ac4mr2247804a91.5.1789087955396;
        Thu, 10 Sep 2026 17:52:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf2e22sm1744557eec.2.2026.09.10.17.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:52:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:52:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>, Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] hwmon: (k10temp) Stop matching Hygon devices
Message-ID: <591be587-d6be-4fcb-bfeb-a92812e25b34@roeck-us.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-6-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910082734.3771675-6-wanglin@open-hieco.net>

On Thu, Sep 10, 2026 at 04:27:31PM +0800, Lin Wang wrote:
> k10temp matches the Hygon F3 device and uses the AMD SMN accessors.
> These accessors derive an SMN node number by subtracting PCI slot 0x18
> from the F3 slot, then pass the result to amd_smn_read(). Hygon PCI
> slots do not encode DF node identity, and their SMN roots are grouped
> by socket.
> 
> The derived node number therefore has no defined relationship to the
> Hygon DF node or its SMN root.
> 
> Remove the Hygon PCI match and Family 0x18 branch. Hygon temperature
> monitoring requires the Hygon node and SMN interfaces and will be added
> separately.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

As reported by Sasjiko, the documentation should be updated as well.

Thanks,
Guenter
