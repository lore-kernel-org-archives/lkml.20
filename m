Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794672779;
	b=rbnwf/AdLtaTZ/7RN2MDy5Lm2TSm5kuUUih3ajeVv40ErBnJ/k/U427vpf0iUM0clSNH
	 D+RyHCHIVh9k7FuWKjQjDlTRDsX7SPqFxE2hwpqrEYd/3vWMSAT81bR7HyZ0m1yAJ9KW2
	 7bk8BqoZJL0BS3ReoHbBcm5plGWUB6OEzx9TAOVSgsnZdQ2sHc9KVkCrQs+FpM0yDk01l
	 DrCCEP6zG0ULZAvn9nj4l5qGR31dq4ByCUtnnDEa/GZulByzGUQsNwJYBkI/Bzx3XyHDC
	 KlYfCooXZlMdUwh2S3QTUS979ugOaLgsXw/2vNF4EYRJ0oKJ/iW2RmxwhqM7bEMyUgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
	b=sa4mUVSrHKx8LgrqNHPjOnxojpi2uQwdqKzD4uc/oF60+EF49+MIPoanF6yjvPLRVyId
	 wmdRb4vU8iOu7G39m+clNJAUDeqPlb1LTQyEcfWFk8Qsgh/lUL/qT7yLp+z4v8rFQznHB
	 smSld9atk3xvI81gYTqi21MSP0Hljkn+1gyS30fQMxG0KkpHa9e1JdrYF3m4v27X+fOs+
	 InkdlqxjjmEtDu8xdBFEipOcv9/BR66/gdoi7mDE38G26dI2vGmZihzVnRR0xjgfcgl2C
	 GsNwCvC8P05qfZrXqvq0na41dblntMO/LfWVvWwXPtNg9HXQKKqASHttBSE0H5LKj2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PPo4LOQr;
	arc=fail smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD47606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD47606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PPo4LOQr
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55c7445cf85so114661cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672778; cv=none;
        d=google.com; s=arc-20260327;
        b=WMwbr0l0G9kF5t5ZmOVk8ezpC9r9UHkcPv4cyT9U+aNd9jAn3YDjRey2iocgDaMRtA
         OJS97YMH9gLaD8psEN7Y9jUb55ey16OaLCyg1t+N2Vp/b45XOO+xK3AIqkK62ChJt9us
         qnN9sQfV/fQM6OV3PptSnnqprCqAH5td/uUKs3QIQABWsQa/ZFxncSiHO1qd8SEMr8wO
         0xaMjqdJqDlNBBXDhoIaKMIQF7H0NB893RURdEy46Mi0thIRxOCPv2ae/RzZ2umEyLyN
         ONfWSsUZQzErKs7nazqVyEmUlQLD4WZsSBRNgzv5Rf3dR1BT8NLDS90wFc3WzZfLQt00
         ryTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        fh=lSJi3YqQx8FGF3mazS2TrWEB7O6caRtBljnMdnVn6oY=;
        b=oEZXpH/Y1sbSqgC9s0MrFR4Jl5FQtC8IQL0mWMpo5nn7JhD+iwE7J4wvYGdxMebWqN
         hp5S97ej2JZQFWn21SQAQ9mgbBb5MoTztl9vrY+mZo6B9I6eHImVEeU2DxDm5nhA+4yG
         hc1wgB+Nt7BnTfA1lbhtfGLw1LumaAeHn/FHb4w0l1tjLI5CIw5GVwTI42UlThLHRGcI
         jMVCI/cUXpV1SYLfoOexdPZBoPLK+qBX2lvPEm7AtGuu/uTirvp8uoGmLxTfBXphgZ+/
         FcWBBALO5vG1K/il5OdsPnJrgFRF2VXUGGQcjN2wiaAd1LygLBuJ5KhFfgviPSCtPVqP
         OeDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672778; x=1795277578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        b=PPo4LOQrKH2CZMhlksHE+/7Vjz1wWftJgfIKRBAkgyPYEc65jXFXnbhbOZr5uQ5noH
         EF8vSbpDd+dh1mcPE9e53ws7qqoVAOPrnorDgwuef/KMCysmvNro6xtX4L2nC9AdbKGH
         gl4mPof5lPdvKTin8aE5lXuRNkeG8b2I1PvOpEYnksaS12R07DsXkdwTPbmzW7dlXNWK
         QNXG5bcZyABAcDW7s3EGKeuDB7lFk84XGUsd8zXOg46AgmTqjSu2CIYM4uDUWupAcJpN
         1o1R4qfL0P4F5brOYSPjvO1uwRJto3HFKo+MW7WNk37UUAsTvnGielhU16WHGf4ILl9N
         lyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672778; x=1795277578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        b=J8WQWdwtTPS1aK2MJf188rHQjST7O1fiz0IqfRuZ49k8GViGqVwdwwgsZisFP/FLIL
         iT4uUHH0ks5KujMQO8It2X3EuPvERPeKaTrRnM1F7zf9fLbRS+as9RqnY6/HvHwWyjV4
         D7wOKqyAs6mazmbQ88LkSGhE22nFA3CY9JG+xkd2uWUnmtJfjdqbrfJryLQCmhLCZbE0
         q1oBlu6gIXKr5mPE7iw7hHPYTaeawfK+jkZe7UmPzvZtehKLHVXXCo6WWsQUGFkLDTpD
         IxCoX7vmAaeqoym6QakO8LFJ2mnsXX/iI31HIEYODD9V93UzIhxiCigwZNHyg/Ff7Zs1
         r6Ng==
X-Forwarded-Encrypted: i=1; AL+hErHKmAXEg95zQhH+KE2o7eEhEdJf0c6D/g8S0oJFd2syvzxjFg5S8vdxmUEiPw/BiSBeSh4xgJNSWdw8Brk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1T0BFjcUGuFjnQc8lVTpaa/+ezxs0gUWJc4SywaQlKitjjLpf
	/jQQGf5hAAuwzIjfiTsx4ltK4y/t3lJTf0BrxTuXqnLs/vWDm1pu35+N0oJSU/zlwoz0irUBmlJ
	wOldOBhZDSa4pLo0qomNhjtj/4aVd4A9nWQ9Cl8q3
X-Gm-Gg: AYBFou0zfgSI9WBXEqNoZxiSb4SDtA3x6lF53eJzUy5CfDlr1NRaKPCWFY31LkQB8vB
	I6Go7ek367OBEudbASQZ+9kK/jMF9mMx/RftWK+oC6oVNQPiAa2IVR2hdGN57AH6JVdS+xRhFTi
	zxUNKoq/vKnW5tGXIm0yRW/NdCtcgFU88L//3VTvLCKvXIQt14CMw2SwyN+X1r+f/l5K6hHXp3r
	xy+1KDkJEd9zw7KbsLureqRGcrydSmX7fVM0jaZm/2yEJUbm9pOAKOAOc0kuFeKuGjz95pkItTK
	dURZz4dPEI0KtIWmK6bdUvP8Vyx3oL71lY91NGSUwBkKAODAOLah/ynRexqdbJcgymqfJVeBXWf
	nExej92/2uIsClszCBqfJtLfBZTct1rVYp4nqHMt0Z/m/q36HJwjwnnQF/vXgpnq76GDcOx+4Pf
	VdZyXIyanpIpezpx5g+3J+D/mfSv4=
X-Received: by 2002:a05:622a:5c16:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55c45b33181mr14926231cf.4.1794672777383; Sat, 14 Nov 2026
 08:12:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:12:40 -0500
X-Gm-Features: AclHuK9iNgT_YlTCGTFwNYXfeFtk91ZEPupuVOoSktUih4_lAiwcpfhf4SAWccE
Message-ID: <CADVnQyn1n_BQZ_E087pwaa8fjsz1nuB6XSC4QanE5LLgaScq7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Check that a passive connection starts at tcp_base_mss with
> net.ipv4.tcp_mtu_probing=3D2, as an active connection does.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
