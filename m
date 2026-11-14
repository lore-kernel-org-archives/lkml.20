Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655036;
	b=wjzVc1DpvAZS4RDDKik6kSdQXsf1AJpME0h7NN3mXzDVu5Vkz5xQn6F/2tFtMfKkh5Vi
	 UlTSjmyNyFWpv0mw+k0dGq/boOgV/QSRgc+89MGNODwHszqkEyD0khsSLVbbNBz6RVPhF
	 1pyPn+eVhTGaJCcONccvwsGAjRwHk5uA0lZoG6BrpgZvPxEJkVB3c4NQtgWAsNWkFtryr
	 gj03Z+UEBITWQJXq+NBQ5fl5GFpBRXymxSv3J9Lj+TmB2VwaLJLYf6NBuZ5jph2CFcevz
	 OTrYGm5CrQ8BBl7wY9og1WVPI81erKVnMBjBy8qZe6TO2+3QSswTxHoW65pZj+mjcgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655036;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:Message-ID:
	 References:X-Pmail-ID:From:To:Cc:Subject:Content-Transfer-Encoding:
	 Date:MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=CV9YuyTwve6Y8x62zgH3MEcMQ6qnkYv+7s94JQgp7wU=;
	b=zrwYl7uBCffGMn92bv67tNkw1UTC6MlHIIkLHWRdppDsaC+AE9UdM0EuoTfvcfCv9vcI
	 UyLpjN1W1fBRq9iqex72TMHg55yK7KlJ1aJkGXMmTtnh0L+FRw1npYXIeJhDql0y7N1uL
	 fp+bR9/O1M1FEplKdjkWQIGDg20RH4W4sEwQDsGNc5qLKPQBeUBxfgKI8gq8JzM6ZBDTs
	 Hoc6gDr7SJHHRTnmX/Lrbn8CLAn9/qzjywxCHw426oX9JOixu4Rx34K+gcmbzpbt09IOc
	 ZSBUET/wLxPu6KrOQ9POsfpM7oCWb0zJUIFT+Y7WTd5dGum8VeOvbq9ZALSXOzqPhPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=brar.si;
	spf=pass smtp.mailfrom=rsend.brar.si;
	dkim=pass header.d=brar.si header.i=@brar.si header.a=rsa-sha256 header.s=resend header.b=hUOv+lsy;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b="jjCMD/Mu";
	arc=none smtp.remote-ip=23.251.234.50
Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A8E606A884;
	Sat, 14 Nov 2026 11:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A8E606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brar.si
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsend.brar.si
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=brar.si header.i=@brar.si header.a=rsa-sha256 header.s=resend header.b=hUOv+lsy;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=jjCMD/Mu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=brar.si; t=1794655031;
	h=In-Reply-To:Message-ID:References:From:To:Cc:Subject:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=CV9YuyTwve6Y8x62zgH3MEcMQ6qnkYv+7s94JQgp7wU=;
	b=hUOv+lsyfZaVcewrBD2Ok0bzT0GvothMNhxL4jHrdprdr2reWiNXHV4VWJfR5sPF
	QD7O23vDuHzXvK0J+hA+ljElC+8QdGVhUe8hAidET12hGr/8iZSZte/tFAaCS5SzZS/
	IBwyPghumlpZgHSdoeWkjENNJe9GdgMo0fUoWBv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1794655031;
	h=In-Reply-To:Message-ID:References:From:To:Cc:Subject:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=CV9YuyTwve6Y8x62zgH3MEcMQ6qnkYv+7s94JQgp7wU=;
	b=jjCMD/MuzB2rApZsLSqlw4wZmE6JEkfYhpdJI5VUoUS76ufWsrsjXTgGhgIt+aAn
	uwo5SGurRioPccWsGwnYMs3LW5QuF7TQBPpuuU6xC3LcTm32FwaotBZpC4VScYquxOj
	MZYUkFFi83jj6F4GT/5WlwWGuWsQzx+Nf09DTYpg=
In-Reply-To: <20261113-dpu-sm7250-v3-4-30bdec59d204@brar.si>
Message-ID: <010601a1d9c69050-ccbf5313-4751-4845-9ced-1076e0a55e3d-000000@ap-northeast-1.amazonses.com>
References: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
 <20261113-dpu-sm7250-v3-4-30bdec59d204@brar.si>
X-Pmail-ID: <1794655030616.c0d97a04fb10@brar.si>
From: Ishu Brar <patches@brar.si>
To: krzk@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
	jesszhan0024@gmail.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: display/msm: Add SM7250 MDSS
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:17:11 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.5YL5VvZ+qZ0e19wo5UdMspzrKjMAjMWs/SlfuwHJq77JVCQWpVGwyETo7FaXf+sztO4bYMxF6WHssrYHSY+K7X2T1EZhOskwm44pQQStdKG0Jdj3d5ybzIXFkMTcPBXllY63oWIrFhJN26LFqLzTuHiXuqj9UCHxIuFhxi7IM0GCfceBHtKocmWdFsR9dK9X:1.ap-northeast-1.TOS0vxEE3Ar6ai29fkp2i/jb+l2iigajCGeLfF7S3sk=:AmazonSES
X-SES-Outgoing: 2026.11.14-23.251.234.50

Hi Krzysztof,

I forgot to carry your Reviewed-by from v2 [1]. Both =
dsi0_out and
dsi1_out endpoints are fixed in v3 as you asked, and the tag =
is in my
tree for the next revision. Sorry for the noise.

[1] https://lore.kernel.org/all/20261112-gifted-feathered-ermine-443bae@quo=
ll/

Thanks,
Ishu
