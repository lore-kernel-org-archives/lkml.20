Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76553FD49
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664925; cv=none; b=hTdub8BjwsT9M+sGgmdVv9Oq8y27T/eG6meccqvHfRhAJ1LtQr7mgpdRyHHxgOP5SCe2DTulMbMumGPRzMNWMglGHtIVf6sMVER1HWDjKyHI4nobe8Q1nKopoVhe6cseUAHHfE0cOzVCmI8wCkePXEFjx5ty/USiz0tDbaWE7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664925; c=relaxed/simple;
	bh=ezE7e+8hPeD6bknEPOWbSDt55vcUmx1NSW5YZif6bkw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DEGs1L5kdotfDzxGPiOZPRFOQSa4NOPE+ZnmWf6BNsA+wREqXDLjRVNu+U8Gk8lds4qjXUAo7u2h/vNyQ2UgV25+p5qiVoF9ke/fcIxPfK3W3f0jE/w2AvSJypojvj3YhDNsGbWuwTeXaziZlwYqiH9jw98/h8fvuDNAl71UhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVuYxTvN; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVuYxTvN"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398beb616f5so397074a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664923; x=1790269723; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ezE7e+8hPeD6bknEPOWbSDt55vcUmx1NSW5YZif6bkw=;
        b=iVuYxTvNLMPjMAfCW0j0FNuCl+bP66PzxM1D8pkhlu1zOCzoAwveE2Us06+t+lejrl
         U5wg8NxNiGf5QlOwIvTLXv4a//VHwxWfxCPhiurnZ6vBmPdvfMolH/PWDtbF6TCJOqi2
         44aZWQNYE/YrlW0rq8dbgX56SbYAhFCMahUnZgXl5dDLyP0S7zRojFPDP2BWMT56Upcl
         YRSacQvl3TzEjo1yPvbd1YveNaDKieB3p9GI/forJur2LMwo/Smr8Ax3uI3qEzEAJ21G
         D4BbKbFsLiln5668FLJwWTT34JuzyB5fIMmqZ/Zb6ytdtm6D6HRIxzchRqxnwoQFLUwD
         6jWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664923; x=1790269723;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezE7e+8hPeD6bknEPOWbSDt55vcUmx1NSW5YZif6bkw=;
        b=DPgt+F4KWv08pKV3zQLocA4WIJvn+9tI993f153S9ATSKMGuOwckDm6jazL7EgwWJL
         ZhsanUZJ98Bvq8nmdjN2T1Rv8vMyrc6TQ5Wa0YWReCAhHOWo7hKSPCVyY7rt3Twwg+zA
         Mjkb5famA2hq+yI8CBxE66X9NLtBMgas+jTY//lsGmoVA6L/9rGM6lCBmNURVwd1PN/R
         iq6zBpnr6ER43LfXxH56m90vtILDvWiMo32PLWyAl7SaT+PKYsYNTpuXoutb7NvG1MlV
         I4BG1ZXzDSg/XtsxUKyvGTvSudwDNjn9B5SE7xArrqUmOg5+0gtzCnQV1uenda1nFa4P
         oWXw==
X-Forwarded-Encrypted: i=1; AKwUvBzbwM8/Lwccc2ak4qjuXDK52thsPS36jjsJJ2vNJYj+cer00/AhEH2uHyZ79p7mXzycuAVP9jZmgXYrfsE=@vger.kernel.org
X-Gm-Message-State: AFuF++l2q1ZTjV7eX7aK1W3lu9cfatCeRjMbu4SJ69z5is4+6AoznFyz
	bc8fqfiJCx2HHPrm3o46tOeiRc23tBTIEEaj8qif5XLIOYYZdzwsyeLs
X-Gm-Gg: AYBFou21ji8CEYLimkY2MPKLbYDoKGiWJrWEjtnPZXiNeQD07HqIG8djRtmOWJmzy+M
	Sz/8fAZwISOZJbHDSg9OR4I7/XWfsccGXKMDdwtu0t7dUqF4ptkvHUmyeXMRbEkLmeU0L9l427z
	xzQ8F2Xv2NJbIkc7D3nnrxd8sXADpjpAU1WABqDoXa01KsFqGqLNcZhGy8uhmAOdoU5uuGRwd1M
	l9fOc8bKXxg6oIQGSsmuuG8Yc/Oo57MRjswntwo2nIDHQ6yOBQ8C4d7HKe4qehhPeTV74BX7Vpu
	ykbdRUPoNDhceRA+vfj0j6f/3lq46CJ3mT/Axi5CBmxh8RwccHH2dHs9rx1MLuzbSHluZwoVc1F
	awcFuQwi5qOhgpCcT8Bd7vZmsp6V9YetuhicmGrneH00/aiQiCeNGRB3ZKAM2RUjj2vQrH5VWcQ
	dAf/1Faxl1Ag3t6Rbn+UHrWYkJql8XcVlaLIgWgKJ7FTK7sCvBaS/UoudbeMivj0Xk611kOZ8Nu
	MrhEJ/ayiK1klmYXu0JJuF+rvcI
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:bc6 with SMTP id 98e67ed59e1d1-39e4c7e0e37mr1026900a91.20.1789664922555;
        Thu, 17 Sep 2026 10:08:42 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b7266sm6066044a91.13.2026.09.17.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:08:42 -0700 (PDT)
Message-ID: <c80c4e2aee9502d781fb52bcd5c0972ccd3bc7e4.camel@gmail.com>
Subject: Re: Missing signoff in the bpf tree
From: Eduard Zingerman <eddyz87@gmail.com>
To: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, bpf
 <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Thu, 17 Sep 2026 10:08:38 -0700
In-Reply-To: <9d668d7c-8f85-49ad-bdb9-5cb81fb6f60d@sirena.org.uk>
References: <aqvBPVcN__UX8P85@sirena.org.uk>
	 <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
	 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>
	 <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
	 <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk>
	 <DLHK013DCY3J.19Y8X3Z0RTWCI@gmail.com>
	 <9d668d7c-8f85-49ad-bdb9-5cb81fb6f60d@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-17 at 16:03 +0100, Mark Brown wrote:
> On Thu, Sep 17, 2026 at 01:27:01PM +0200, Kumar Kartikeya Dwivedi wrote:
> > On Thu Sep 17, 2026 at 1:23 PM CEST, Mark Brown wrote:
>=20
> > > Do you have a full list of the current committers, I guess there's be=
en
> > > more bitrot than just this?
>=20
> > It's me and Eduard, apart from Alexei, Daniel, and Andrii.
>=20
> I've added you and Eduard.

Apologies, that's on me, some issue with scripts configuration again.
What would you like me to do? Force push with SOBs?
