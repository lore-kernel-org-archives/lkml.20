Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5109282F10
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791033723; cv=none; b=DWTqMGZqX0Rfe2Gf6FM3HdmMfu507aVJSaBFbGOxYZNUbSA4Pq0wEdAvahpaF72tVgdPF6DdPGLuHPDk1QD2HJrO2qU+NGuHRiFZfTYji5D2wxbuF2KF545w4Jk2/jbf9LCrcbZn5EFRFUCyMQAKiYoyC/YZaRS8e4NeTwCiIv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791033723; c=relaxed/simple;
	bh=S6IpNBcKmL3PhSWcpf4N/fI3jBT4wveem4uoeaU0MHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVn7LX66iNhoF2K5kjiCYOgKeV/BBG+UX3BUYIxRPisqr48SQnS0IInRMeFvgIx+VanQZwK9vGUP3VRIvhilexLPXHaeRF1/VEG+p+1KKrSDG9XOXk8gfHYTn3N26OJXV0hRu7SYqv6Bx5x86SWsCo6vJT4DONWw+lRDJ6uoL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U43FuAKq; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U43FuAKq"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba418c79ccso174206e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791033720; x=1791638520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKBoRMRFEoo0hLGBdRJZ8j/cK4OAfKROIAh0HFjgvuQ=;
        b=U43FuAKqEICQGXBmqTl5vPkJjfVP+mseenjwCILcaBwUxDsO4uQIEFR70aVkQEpAKe
         LFQggIEmDlmi6gu7fT/P0I4pEiINsA/nQPgwRsts2L/fJt311A1owjOvxTog6QuA05Oy
         GYtgIzN981x9UgOQLGSGokOe3iptHonA9GvuvRO3Jv1luUAq47Pe3V4e8Buukc8h+KpH
         BK93GnpFgxKOITKQ6ZTQk4EBiGPmdDC3d8Iq0jZGVYSGY+3nLTWZxQF2XHZE4VGT4wIA
         gIoBGUsOJQYuhLIxHHSdHbr8mOmw0XRhBLIk+klOAunywqamjeRAbQyiXkqXzGs2jSQF
         zS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791033720; x=1791638520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKBoRMRFEoo0hLGBdRJZ8j/cK4OAfKROIAh0HFjgvuQ=;
        b=flAvoNKhvjYA8WnibeV+SDd8TLzoHcvveGgIJj1HMez2uiBjj3FQKd4KAiYz+SDO3d
         PVpBAHmUjw7OxEeQVrcZY54o8DEI/iSp9+RsCgpoaNs/Ci6ppjiRg+wQl19pmlOyemdH
         +VC/tb81C1ltTT/h95HCYFjqoVVZVMhLGvbDSAsu+QdVZHyzYdXe6ZNzDsFCEgsWuqTm
         jzNA6sKoMsx2QEi3yiSwdOKDqMg+9U/1GES+7T4ELDSnO/+n+RnJ13cAGOg8/QInsdYf
         Wlkm5L1jbICangWPoDSTgHuVDObntuN4NNFFUBDa5AuA2V7SisEKh68xTLaFK6CLjTAp
         D3Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzPbRaTNRvPFmZjAiO+oiaRhWAbkXq9yAcTxAb3zwy/k9OntFzeX4alF9Q/WcBQKQ9+GpOMdti/NNhwPV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9sVzD1qitSMOaWlyZuVgqYYtqSMUmMe8JZf/qxM3vp3mkCOki
	lPe01uwU/fhU4dxCRc6OVPHGZfqMf/dc5eTWZRlU5wPTCkWuwj5gpk2jgLRHclxkVh0=
X-Gm-Gg: AYBFou3W6JaCsdod8nlIm1wMl6cQKi+XXIPbmHj3WXnFdd9fBasadK+TzYZxg58Ayjb
	L7L8+Qjum19IK8JAStTHpivK2c5TwyxVkvRDyH6WxuiOfyGxXdszlpDEExGTYbfy3lsVNpOFiSN
	MotPOhFv32h8Bmr0DnzKJv/FeZRUnOrH3F1hl0AHuWSbq/UaCqKiviZ9LzGYLqcSwn5NKukMM8x
	zaD/EOhOf1YVJlXYf4rWb7oSFAlKCcG40R4SikoINHKL5ApwFYKr+v6an7s6Fbde/861Cju88tg
	rrnc03HuM+3icngMYJ4NaK0PAl8iV0NYVckCAj8xmazEuL/GU6NfKTWYBFd4yZK0pFkMf/BXXnK
	XVi19ajxuk+MmUvcrT9gVvR3VYO/f8wy/8ETCEwoL2G6aU2St8IAMGabGEqC4xkCm39SNPkYlwW
	dha2fk8767Se7rkeSzQ2y02GWu6rILinbs3Tvf001s0YO6oxFfMfQavKreqekvvEljcEJ4Mkwnz
	0ABTFIr3HN0v82LeGcOJaOlU9NwPixZxX0FBNXiYVGcNYYBxpwM
X-Received: by 2002:ac2:52af:0:b0:5b8:eca8:c9bc with SMTP id 2adb3069b0e04-5bb9bc66ff3mr1541341e87.64.1791033719593;
        Sat, 03 Oct 2026 06:21:59 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb704sm1595837e87.79.2026.10.03.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 06:21:58 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] tun: use pskb_may_pull_reason() and remove SKB_DROP_REASON_HDR_TRUNC
Date: Sat,  3 Oct 2026 16:21:52 +0300
Message-ID: <20261003132155.4174966-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <willemdebruijn.kernel.3b99b3605b4c1@gmail.com>
References: <20261001093925.3529772-1-littlesmilingcloud@gmail.com> <willemdebruijn.kernel.3b99b3605b4c1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 01, 2026 at 03:00:37PM -0400, Willem de Bruijn wrote:
> Anton Danilov wrote:
> >  	case IFF_TAP:
> > -		if (!pskb_may_pull(skb, ETH_HLEN)) {
> > +		drop_reason = pskb_may_pull_reason(skb, ETH_HLEN);
>
> Should we update the skb_may_pull in the above IFF_TUN similarly?

I left it out because that pull never used HDR_TRUNC, so converting it
is a separate change: its drop is reported as NOT_SPECIFIED today, and
with pskb_may_pull_reason() it becomes PKT_TOO_SMALL.

I will convert it in v2.


