Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441010;
	b=EpdbwmaJOQ61Kyz1plRrZjjoBFqfkCF63CDH2YmrHlx5+6t18ep3TMHUd2eXwcPPhPPf
	 95kVW2e035P2wQAVX2WwDiqaS3GF6y5KJNdZ/gLYU1erYyaPOIahOcNgW429mBMKKuri4
	 FUEtw9Nl+Zlj8bm51Q5ZqK/qfxo1DE4VZUvEiLmT+IjnIzrOXrVAG2pCXaXGApbabj/+x
	 2nK1riBB+NXl3zDNt8fSVN7EsZ/wYbuWoUhMf0GY5uXoNaPgD/5mS/fs89yRilXkHYabR
	 Ui+kz1ge8SwNIf2Jt+jee+XREfQsBOAmT0QUcfy0iJyt1bAadH+eoN0TC434v4viUNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cRFDv/zqlCdXHbrIMKFJTczyEyv3i5WFE2Tuk2/B3PI=;
	b=gFwqKGROO457YDgUyb21iI3wjynlWY7Pnyoo8EEPFCbAXmNH8mZcmhpzILuyYDcz4FT+
	 Mw6AvCC5yZxxzS3Woxw9/cvkEiyskemn/ZWYw0wQuwc6UBwYqFuPzRUpxPeOoYYITEQiT
	 IXFCh8bYARZ7DJHSzh+AExsZE7GwdjRPiDZN/UjrF7ImCUkjAJV490o0abSAbCYZqY02M
	 OGie8hYTqwPsIsFqmQ2+xeuQAkwaa8UfRx/coYwhiRHatT2P0OyeknARIwZYsAZf7yT5N
	 C6qkC0qdy1m+6bPYt0nRi278Km87s9mLD0qzYnc11XZ3g4yRbfymz0yMS1UyMbWGvnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Ev5bcVVK;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0051606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0051606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Ev5bcVVK
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6798eb0d13fso1926901d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792441008; x=1793045808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRFDv/zqlCdXHbrIMKFJTczyEyv3i5WFE2Tuk2/B3PI=;
        b=Ev5bcVVKrf1S47seLR0CL8au2df/RJpNHkTdS+2x6MOFdjl905Be7j+4zV9L6cBn52
         J1eSPwkkC70EPkeJdQqcsn6vNCooV7/yXAtf6IplqMopCr6LAQ8hVF0JLE2a5pg/wANu
         o1zcZWetZcygLxqUqiNCwVePNhSfrfFSH5NneFwSMagy42gr/pHL+VJ9fSrXmem+TcuW
         MTRX+0AWh8gTXWUCb27wyb2ygRzSU/cGehzfLikXMyNdHNJ2FmqF/325mnRHGC6MQVM7
         NO0w8xO32wKpSOtIbvq6Hw47QZ3uxskN2GnwiI1wYsJoOX5tCd+jetc3MgpeAQj8pf1A
         7RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441008; x=1793045808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRFDv/zqlCdXHbrIMKFJTczyEyv3i5WFE2Tuk2/B3PI=;
        b=G9wiHbJn7Fl+Sm7gynTLq2b2qS/aGaU4AryvU3VlLOXOgIxMIXa9xD0WFNo8SC1Cfm
         /eO+16D/SiaAO+iICIl+GdRzA7B0FJumOWliwaJ9G08/8sFzwsJe0+VqhBf0HJxuU5Jr
         QLgoC+tA62XNxs4aeZTiE/NS8Aao5Wh/9c2KwwX1pY1BoG9M0znr9Zue5jQ4q7swYI4F
         9nyHt2FopW1mbSW88EVwtJZH0BugQ2q170j3uDNVBoBF/LH7gNzqpZQO2B4WYDgSudZQ
         VuaVn4Xmbu7A2yV0aV1VW9w0SjLtBFUKrzXEGqxxErVc2adxVVpzCfY45JOTMAahntlG
         GxUA==
X-Forwarded-Encrypted: i=1; AKwUvBzLkthNsdJD6Tb5bQ987DsKFFkJ0zpODt8madFJCbcutbvGogDKquj+FuxKnT8BNE2WJOGnuo3hr9hkD08=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV6SA1ZpffLPfvDzT75aVl0Wzr9195SID4bsmgRnDURmPZpFNn
	DMQuWwaS04iRmo7XKh7Vtc10tsFgMUlAnYh1Eu3V6ADOs9fRNfr0JZVeowGQEL2E8aQ=
X-Gm-Gg: AYBFou3j/G4rD+LglJ4RB7i8Xn4JFcA+FAsP+QzHFgG1RCS33x68p6HQbnGo0bAjc0M
	OSqFEDLResRyli3rf0ReZUXyroeRS2Yu+dTAPnSbartkpssWasP+HCN72IuZUtBZvnIdwdMhaip
	js7AVapFew2ysjlsTJFNABvjtOx1UQM+xthnq/Tb/5Sg1O6/O+jMxO8/a9Gy4Uaok+cc7QyQJ3V
	XZ94zPaABqGWeH1Zutwy8oRNLqURmU103ULTu3Uzju+4Wv8+fB4k8EOBLzaU34ch+H2bmNnx+1m
	Up8J2MLByoDAAFXnoKawYlfhKR6WDRgDaFmJ5dsqigz2/TcmmzfIv7SS4aKINxU48JesAUHsVKd
	iTUmnxIKcAMtmTncvcP0umhud+p/OlZAomUyFQGNkc1lO5mXZXRJgDC9BJOeXR0NEN7e0agXFfn
	Jgb+8q0KEqzdwulb3lS3LPNDa/Z/1CXWtEqnoK5gZbcDbhSF5qi/EnHAwhewOS0f4D/DZPYQ==
X-Received: by 2002:a05:690e:1381:b0:679:9b34:a2d0 with SMTP id 956f58d0204a3-679ca54fef6mr2000528d50.18.1792441008370;
        Mon, 19 Oct 2026 13:16:48 -0700 (PDT)
Received: from localhost ([2605:8600:200:1d58:2ffc:79a5:7374:fa95])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b19c3933sm4507704d50.0.2026.10.19.13.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:16:47 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:16:45 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com, david@kernel.org, mhocko@kernel.org,
	ljs@kernel.org, dave@stgolabs.net, roman.gushchin@linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <20261019201645.GK371161@cmpxchg.org>
References: <20261019185002.3428594-1-gourry@gourry.net>
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
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>

On Mon, Oct 19, 2026 at 02:50:02PM -0400, Gregory Price (Meta) wrote:
> user_proactive_reclaim() limits per-node reclaim to
> gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> reclaims a node's movable memory. A movable-only node, such as dax/kmem
> or hotplugged memory onlined movable, reclaims nothing and fails with
> -EAGAIN.
> 
> To reproduce, fill a movable-only node with clean page cache and write
> 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> cache stays. The same write to a ZONE_NORMAL node frees 200MB.
> 
> Scan every zone, as memory.reclaim does.
> 
> Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
