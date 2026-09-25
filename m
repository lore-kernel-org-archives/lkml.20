Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1C4854F8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377933; cv=none; b=KTv3k7EfoVeevm0aiqPTbYwFbYYKY7g58HVHqND4MOMrrILAm3s+0WwY4AMyt2Zw+1vd2J9IddHP2mZNRrV5EFSlPkz47DDLtYKa7FmJKanYnBxG8TDwP0MgBhUtNPYlcqlpTW8SBx4oWRxmTsLhS20OwwESeGFPDcjrFzoVjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377933; c=relaxed/simple;
	bh=ybLOr3FDsnQoXtU2ro+MWcF8GTD8LhmOFxqQajcdAWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvZA05bHMdcV9AtQMEf5sdkm/9U6RFD+bfEYIkag2bAP6eeyJwWxsqsd+7C+ZXWXf+/XB9rpt1jOL0FbLvl9NsGfnlhs3F+Gw2jIVNMAvyry6oN5iaJaPMXATPRrXeTrCoityhOqGl/HzLrWHCRRtEGCFHOTIn6ktmNAgeAWBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szy08CW6; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szy08CW6"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so1339020e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790377930; x=1790982730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idOZhCq94Yr7EO3Y+X4S5dviexgS4OYmWui9ECgBH9A=;
        b=szy08CW6yKeB21967SGp/T+RSjHck1bPczC+mzEM/MwikhpcW8cKgEzMTpAO0h6Z9e
         qVFzwWTq2Awyn/WxKXTuCZY15QtfC4BuuiL84yXoHWokAf26UUFDBzMWKh+HB3+rohO9
         nbjkefucyc0XqfJdEUCqG9Q/xT+xA2wrzSdJ7A9C5iSeyKHrVn8Ly/xn3GE798hbOXX9
         a1LLmGFHszjk5mRUg9hZdWaves7fkjJob2darHEpirhh+kFlSONWg6CiNgZPnUiDiBSh
         oV33KCOPRLo+LJFy6tSPpoSDIJfTgQ0N06ZdtBYibBJHFJq+qhebcpb4hjp0J/pfdMW+
         GO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790377930; x=1790982730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idOZhCq94Yr7EO3Y+X4S5dviexgS4OYmWui9ECgBH9A=;
        b=iCnobwclAnusvKlzyaMZmORK/X1ocGfnkThxeSSK2oHHXVMl3SYEOnXpq2oBn43CTw
         JngkMHf3o55rtVZPOr8bDOQwoiTfAzdgo/c7jHlsssc7kxxnO2glvPNZaiKUSc7rYlnD
         Zzb/JomUjQYJRf40jN2ixf/aGSE4iv+CAU8BbLHoikIQGriYs85+4vHV3+ndX4IljuZY
         8oBdaa+t0zth3ZZGeNf9X2ookOlZkr+/qWvJe9j/97Lo7r6fNu6khlnzeI455Fhleh1Q
         OeT4tDrXjDvLKxS3yKtZxJEiYITmwyZOb4vaU8fR7cXON7kvcqS/Rc3l0OOEoz7UX5Fe
         r5GA==
X-Forwarded-Encrypted: i=1; AKwUvBxTWiyfEsGO73dsqfo4Y4LacDflgO82w+w1wjfdK2iNw0Ev+i6pdb2LTvWN8V3VbHXVSWutV/1i2WEh8/A=@vger.kernel.org
X-Gm-Message-State: AFuF++kTorQlx1HA/SjOUtxp+CXcSrpCumffxnIyy+TFdeMwQvwy0Wec
	e1HVCDgnS9OtgZDPv19KMNnb69VmHyiUzEcX+2Dp2ErBWijmsXaIsqeh
X-Gm-Gg: AYBFou1VO89mQC7C5wV84T5k1YukvOeAear1Ft1Ng2OpvKvrox3kgadqjRiQFn7FsQG
	9ljGRW+LFf1mH6ayrbU8amPGyimenmCgr/Y7DFJbD1K9NwOnyFpfFavfHcUUdWJrKGMzB6YuYN/
	8CQVW4mStajSQSwI5mrD8tT++d6LNskMhfURTBUnjG81DRvzmq/uU1AwduswCs2cAchWZyloQ4F
	svBCAKftojWIwjoyJMKuvxhr6Q73VIRHfoj9Tu8L3xzzSKEoK8+3CQeOc/UulNLAeWe42W0Dwxd
	v1rerMyGaqkHzJKM81hFuCYHUxMdCnbibk/Kp1ABAuAiWY2qiLBNBxH93WZ0jD9OiOZA1UXWrT9
	OmtO7FuE85EOfONUYrGIlck31vZWOuyfaPfF2f3qo3xwC7sUJv0OtSUUBz6GJSOdvLCw2iooNst
	erx5YdfSUwctFx2lS1R+kIIKR2M+C4Pcf3PrWD8AV0j5m+MXPPRCfT7kD85iAk7FR2qEoMMsbjk
	6BB4s09B59zQlmczP945N1eaulO612E6pD3+ffrAA==
X-Received: by 2002:a05:6512:12cc:b0:5b8:e716:64e3 with SMTP id 2adb3069b0e04-5b8e716662cmr1435725e87.31.1790377930246;
        Fri, 25 Sep 2026 16:12:10 -0700 (PDT)
Received: from dau-home-pc.. ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af1375sm872665e87.33.2026.09.25.16.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:12:09 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 03/10] gre: make gre_parse_header() report a drop reason
Date: Sat, 26 Sep 2026 02:12:05 +0300
Message-ID: <20260925231207.542162-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923145931.GA2859441@shredder>
References: <20260922221507.3268127-1-littlesmilingcloud@gmail.com> <20260922221507.3268127-4-littlesmilingcloud@gmail.com> <20260923145931.GA2859441@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 05:59:31PM +0300, Ido Schimmel wrote:
> On Wed, Sep 23, 2026 at 01:15:00AM +0300, Anton Danilov wrote:
> >  	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr))))
> > -		return -EINVAL;
> > +		return SKB_DROP_REASON_HDR_TRUNC;
>
> Please use pskb_may_pull_reason() as is done throughout the kernel.
> AFAICT, there's only one user of HDR_TRUNC (in tun) and it should also
> be converted to pskb_may_pull_reason() so that we could remove
> HDR_TRUNC. Can you send a patch?

Sure, I will send it separately. It does not depend on this series, as
v5 will no longer use HDR_TRUNC.

...

> > -	if (ver >= GREPROTO_MAX)
> > +	if (ver >= GREPROTO_MAX) {
> > +		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
>
> This should be TUNNEL_INVALID_HDR to be consistent with the hunk above.

Agreed, will change in v5.

