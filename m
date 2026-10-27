Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095400;
	b=CnqnnX4LjzFXMKb1AiLZzddQXyjxG80EmU8y0fh3znxIxIbmM6uNqA5pkgi+8FAJRCym
	 YkZymC/r7dOeMSu8lhWZMIn2feHiaZC7W4GVa+nwk/lJ7foCB82LMWtHLTsdXAcSexGYd
	 Zmp54eXv28RUYaPA8hl8bSM+0I7zqFqxewdDQmDETFyx6nkOyZFqpy9uWzh2Jx0wI7H/s
	 W1gmtdCMd6iamNmQL9ceyeTnR5yrQMuW3anCH/8uVBhh7LpjqBtv+J2So8LPaiHeCfICc
	 /mGuA8RPvcwqESQEZqRKLZurOcPOP0pgNE4zVsRoQ2oJ9nH/ALhrnusMS4R60bnWfjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
	b=ItiW8/GzhBB/JqTZseDh5h3hAhGz4vx9OigzgrLy0TCxUXMvrLOBT9LqgFf0wNBGtcB9
	 Zfu3Yf9cfUIvTc1my89rxwVAe/ruBMJTxA93NY+MJoq9BIhAiaJnFGYLeEfzg5OScdXHd
	 m9MsYhu5/lEodJSSJjmLZ5ieUnSg3/glFJfvVf0llQgsW7i41D0GE95pwnXuLvMXnS1sr
	 Sf4InXCLchZQI9RUteN+MEt/n0m5dv9mI6w4doFCJxmzxH2Oy36oM0F5W75qKsG9i+tuf
	 9UjfFsQ0O/S6slnF4BHXwEtgaSNyqeqHz3srzmB75hpokLWMZIdx6UuFsfR8klfSAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BBB606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74BBB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c418e215671so504448666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793095393; x=1793700193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
        b=EKwpsigzwDmZPRkvIpX1b4c0/rz7uhtPntV0JfCYEz0s3pcwkOGnsL5Nzc3IENmwos
         3sbhs5QgQhWDLpAOwIEmEB+wgVol0pjCngvClscZPLVgXpK6vwt6ozQLK9jHaqZpS7Wx
         UAwHaOAiTlSXV7JOhQYBkg+WaE7NJjWYx0Q2jkUKe51KAl6u7hwDCeM2xNigR7jQ+Esl
         2TD+6FVjssyPooQGV77/khcqAuzCs5MkcZsRcYmk+07Rxjllua9OU3dnOSkEIb4tDpCN
         GKiS0GgWXoNCU/s9g+GrCc6/QeqrtOgD8LLSneSwbAfEJ6r0lK+DJ5aWEsAXcsoc+VP0
         o0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095393; x=1793700193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
        b=tR4bBsxySKjraUljIUwURtdjArrjsBHI6V7K7e+IfYWouZAAyJQvjqhaXVPkh0JRtv
         e0lK+uWHq+gcb165aus7d/7XwIM3kN+RHoIBG8NfbVP2Eq/t3zu3CpBd68qtzYRCySI3
         XAlneiwHGw5PDQlScxddQjtHbSlW2yyivCZz3tT/NFrGvbWqbTjXzycFZbOmcpsFkwsV
         ZKC2Cfrien1FKpP2Cieqov6Mc0rzD4GQ2BIfkZv4wjL0VOHEp3DnqzXlmvJmaUs0SXPi
         +Bl4+EMs+i075Uu4ncGAr4LKBzpP+pyCUl744/XQgrk9f0NliQp+PyMxJ/gnUtu6vElw
         PexQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHNkWDKZBD8x2FmS37eKk+OTMTxsoOM4Elh3PBXLKVosWaJChSl+Ls+Jm+gU0gBRlARJXhIj5Tb3+fe0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ+H//B23cnzyBjZcPur7mEAfAHAnwnLY3UsM67yEUtfZfChAo
	JGnBhRwXbBzfa1Sova93BlQs+zAMTx0euFCZpvIxV3OUVkrDwJw7uCpxXspcPlNGU7s=
X-Gm-Gg: AYBFou0MGTh9Ij9H5894RIigRmctxWkVponltRZnZ+kO97NG/3p+vzj1KtiHF0gr6cF
	arlGC37siJjlrA60Xg60WRrWa6YHxTHKXu+Tg9CFJ9WTyADYKaCoCWsGOS9jhF5UhAJaPSAuvJ/
	/ajTKb+Y55fpxRPGWERolC1smoYY555lT+4OxWxEH+HF4+Cl8fRgeFQTNgcC1Xb5zul9Kg4jJws
	0h374u79TcXqR0SYDeAJK0AQ39orJzT80TIFG3yV4/iT/l+N2ZTFw1gFtOi+cag5LnXtAKTKXBo
	oAXyoSg5nZSZLSG/qMhLppBFlysRm6aHwUP/9p3uZDc22ph92kiqx/CV9Hq6YHDtX2tcP/Y4Szr
	hllvxpYj/0zMiUPpINrGld7svR1qgooXtkvs3XSJgCJHyc/9sKlUt/AEtICz5NWQJLECWYg2R2p
	KMNMadWEXTbDuipYp3BZCJroW2fOTMb6q3hA4rkNrWB6PdlCltuGQaIGWvOzzIP28yLE+EPERsb
	jUSE5ZzLywUb7blzRZMo9xZyjEtqkhDNxa+/qtUoOxSeM5i10lRaebSRW5UJ8VA
X-Received: by 2002:a17:907:728f:b0:c3e:d18c:1d7d with SMTP id a640c23a62f3a-c46bddc42dcmr1033526666b.22.1793095392233;
        Tue, 27 Oct 2026 03:03:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm420098366b.68.2026.10.27.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:03:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:03:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 18/20] tdx-guest: Expose the native attestation
 service API
Message-ID: <auB21VZhFg3sDcXz@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-19-jiri@resnulli.us>
 <179302367453.58760.3338436189030317197.b4-review@b4>
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
In-Reply-To: <179302367453.58760.3338436189030317197.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> Share TDREPORT, Quote and measurement-register operations with one
>> in-kernel client while preserving the existing misc, TSM report and TSM
>> MR interfaces. Tie clients to service initialization and removal.
>
>The tdx stuff should just be an attestation driver, we don't need to
>make these kinds of linkages..

Okay.
