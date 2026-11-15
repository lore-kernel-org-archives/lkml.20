Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749870;
	b=O9BKrqOzpdGh3g2/L+xwJiOyL8feFqzyvB+qjD5poThRmaDjwdf9HWYQ9X6DUU8Psgz3
	 O8IJzHtK+lKFyXPA4p+hNKVPZdTO7q7NFJkt4P/8uh/IVwFAJtfB9sfpsjwMZ07n2Mmvf
	 puNz3cPBsikcig4hlE0+f8vSx+rnLPKy7gjETcwff4RW1PsqHXow5v/cLpsifXK/VSj8y
	 llEe9X7PeWB00W2QxC46QbKNWsJBt4H/XMjmFHJolz4VZcOLHoA5cnsblyQKIXaZ52Q+3
	 M0ACm2daDOCdiuKTN9HnHghuNLg1UAmPqVPI8iR54zo173p91rH1SECbBpObn+aajYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749870;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bn5vgqOLSInNgO9Dzy0nos5aKacNrhet+KuyEtFe0Z4=;
	b=h7Y5iO884ba9N7NQamXWC3rrpRN4kaEMwZHSf9jHrE5AwgJdJyIbQ5u1mf+FrhvXomUf
	 XXzAGIa5F6sYBz2icyXlqpdicuxF7rCUiLtsKNcVqb70BQRx1SM5DXsarCc+5VgYNrhU7
	 Bvj/swoOnks7YpsRu5Z08RMpOtmIkOhSzom1CPfFSpBH8UGGN3SFomxONMNkbf0z4jedn
	 FQlAcZpIHmqCdGHNB583FkYTqJq8R7o+c3+zBGc+uWCdb3yT+zNOkZm2Ptet9R45JndBW
	 75aBYeaiR+E+trvAM3mOr9Ag26xdkrslhAWVVWPrGMU/uhT1pCXoX0suJL9pEDlwxLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aaQPcYJW;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFBE606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFBE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aaQPcYJW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bn5vgqOLSInNgO9Dzy0nos5aKacNrhet+KuyEtFe0Z4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794749868; v=1; x=1795354668;
 b=aaQPcYJWZ9DpRi4Ysh9U62DP4LXNYZxctwtztlL8csL5ahiQFnXBIQGn0u1+CNdMMIlebiNE
 HvwN5qScfKgfOsMslcSHxxkRSXcbYQ/6ks8jZIvj/qECAtkjMipDE/out2V7zXR15Sz3pJW5a6S
 /O+L4Kyg53KOEj3n81NIgZek=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e523b9ebdd69c396;
	Sun, 15 Nov 2026 13:37:48 +0000
X-Mizu-Trace-ID: e523b9ebdd69c396
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:37:46 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_correctly_expose_beamformee_capabilities?=
In-Reply-To: <20261115114336.1739863-4-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-4-hjf3108@gmail.com>
Message-ID: <1F34F485-2BCF-4285-9C7C-189DF4E5FED9@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

Thanks for the patch. One comment on the description below.

On November 15, 2026 12:43:29 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Implement beamformee support for 88xxa since they have
> support for it.

Could you expand this a little to explain what was missing? As far as I
can see, the chips had no config_bfee callback, and this adds the SU
beamformee setup for RTL8812A, RTL8821A and RTL8814A.

I think a short explanation of the sounding and CSI report setup would
make the change easier to follow.

Best regards,
Luka Gejak
