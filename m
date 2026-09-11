Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3789D432BC1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116139; cv=none; b=Sn13vXag74Vy2+iVsfKGRtTCYIfhmyLsBxxlR4c0RrO3JmiRSt9USpqv6mOjk3XHSm/ZCgBhQbfw8Rd0IXc8U98HcaQpjc0vA2LqzsOXlfI2B0ylhe3qWXCU09RORXOUzEJJDaALh+/B8PZZdFGHvI9DSeMM5XGPLu3IBtE2qBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116139; c=relaxed/simple;
	bh=9Rl/2Dwn3EBk+1V6E1oPPEJyovJn7q/s0zuVVE8xjh0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Nbiu8I3Gpt1sH/7qOtyc/yoWu0JLjpy5KSp1keJdAV3tfGF7qbnB+OugjJP+7khQGxCItk4MWoF/EMbVj2ldd3voLT9UsmWdulBJiM3jYtCF0yMpjvKpnLCfwOUrPqFwrRLCJ4NNaN0Xb/QkaWRihvqpozY9IMOklPxtEDG7rCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ueifeafa; arc=none smtp.client-ip=91.218.175.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ueifeafa"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9Rl/2Dwn3EBk+1V6E1oPPEJyovJn7q/s0zuVVE8xjh0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789116133; v=1; x=1789720933;
 b=ueifeafaXFFWP1OHG3Xp2Mpw6YgID12FyBcpTygeQ7viTdCQEA2upIICh/RQcverU4QhhdAA
 B2FyWMdD5c9ZpzFPS32R+9rab965PZ6OKMphvJOZsLkHh8Od0jVMBYDcnLgpZceH5GLnjxYRdaG
 qobPbOSmdd42TDdlsk2MTO0Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4511d20fe87ed201;
	Fri, 11 Sep 2026 08:42:13 +0000
X-Mizu-Trace-ID: 4511d20fe87ed201
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 08:42:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <108d4da2ab381d6e22d4f84f1c1254aa59b20d88@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v11 4/7] wifi: rtw88: sdio: zero the padding added to a
 TX transfer
To: "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael 
 Straube" <straube.linux@gmail.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, "Bitterblue Smith" <rtl8821cerfe2@gmail.com>,
 luka.gejak@linux.dev
In-Reply-To: <a0a617f1b7e34b979a801e7c10ad98f3@realtek.com>
References: <20260909074556.55709-1-luka.gejak@linux.dev>
 <20260909074556.55709-5-luka.gejak@linux.dev>
 <d6507fd0447c4c09a9c80bb57dfef35c@realtek.com>
 <DLBQ2H40DC71.2Z3B32X9JQ17I@linux.dev>
 <DLBR915C5L0S.1TEYXZ8LADNTH@linux.dev>
 <2294d792e937441fbf4ef8169c03df18@realtek.com>
 <a17a665d7d4c47fbb33e038d122ed200@realtek.com>
 <DLCBFNKN09SW.2SIEDXTB4PGJD@linux.dev>
 <a0a617f1b7e34b979a801e7c10ad98f3@realtek.com>

September 11, 2026 at 9:45 AM, "Ping-Ke Shih" <pkshih@realtek.com mailto:=
pkshih@realtek.com?to=3D%22Ping-Ke%20Shih%22%20%3Cpkshih%40realtek.com%3E=
 > wrote:


>=20
>=20Luka Gejak <luka.gejak@linux.dev> wrote:
>=20
>=20>=20
>=20> I can write that up for Johannes as a separate mac80211 patch, with=
 the
> >  rtw88 side as a follow up. It is independent of this series, but con=
sidering
> >  your question was about CPU usage and this change doesn't overall re=
duce it,
> >  it is probably not worth it.
> >=20
>=20Thanks for the experiments. I think it is not worth...
>

I agree, just let me know when the series is merged so I can send driver =
series.
Best regards,
Luka Gejak
