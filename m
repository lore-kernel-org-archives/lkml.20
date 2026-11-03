Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744743;
	b=KwLD/MJD+x19vJXb0+LSRpYwsfhZ33tWhcAQ1A7WN5tp7OCQgiz+mpqh+n4MfOhAUyrU
	 Bvka1SIvYY5mEG9E34HN2pA507gsuLtSRoGq0+TC/I5hgC3yysZeUWcroO3x8FNKtLJ3m
	 06stO3cuNfs7Dx3uUtW21jaojWp5hrsbjKdoSA8XMiKg3vjaANP9QZt15EoKGPFy4urao
	 W1qpbDE10562MmVbTH6g6IPIRx+K3QhYtnL6n/bDXw1arRyt8b0r8JGmYfH9NNsR6i4pY
	 JqlsZdfhqJumK7dEdBfXzfbQCs9Zh07399GsFkUUch+3iaPVlOLZR+CLfQlkRXrAykg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744743;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Sas6yqkE0Fbg5xyy1IYM2aopyVjH/aR36j7uaT3Gc64=;
	b=foET7k05ACCaYdHhmGeuYZZOTr2Pye1RDUT9qvOKGwELu3jKoq86DzmGQvgbq8zpv1dX
	 3nO0kdZvSxUZXmIKUsFTmC0anoHAberM5rYKV3Z3pRETf2TSiqoZYkp/EUFZMExggmXxG
	 yFbu2zCSTURLF6jMDSHQ7XgLYDWrZZlZNisFMHlRNvrke9uSR5raG21+8yjdipbUQUWsl
	 ltWCzOt3aBUErIKGD+wxsMUpWEbF4NUfHI8qXGlX1pvTSJLdCfa4en27h9q0HDPuFv+BD
	 oUdpjC9FtNxp5LWmEKeFTgnB44EBQ+9LUZq7ToEDlcjiHvs71k4OzJUPzbKXALfCJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=pBYt0qz9;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BB606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8BB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=pBYt0qz9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Sas6yqkE0Fbg5xyy1IYM2aopyVjH/aR36j7uaT3Gc64=; b=pBYt0qz9dbLzA+jL6d2+oYGB7y
	ZhuluEKRoGZQgkiEw5tafnQ3UOZNYTBviBjPLy2sl1iV4y6YalKE3xXHIZGdERtsZ43N1Iyg/rxhL
	ZPr8tpTL75b8tBmCVk77pbyFuhIdQQCyjdQibqC+AtoyPurKI0chMfwaGSEKtSy3OAA1qVgJMpE91
	mU6/IEvm8YhAjRnRAFVRtoIebgtFCqUUTmxXHBY5WJK9pkK1SfNiqiw05SPK+eCyo5BmCvq6llRFi
	R61gxWJ9xcvuj7kubbie5e6o1+x6skBtQ8I4m9YYVveI+LSa591UC7NvpN9wxZBH6WGhP3i4Ouoje
	q2k3xKBw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Haoming Gao <Naixumogu@whut.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Greg KH <greg@kroah.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] accel/rocket: Fix job submit error handling
Date: Tue,  3 Nov 2026 23:25:27 +0100
Message-ID: <179374472347.512720.18000593798629455371.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828064152.37822-1-Naixumogu@whut.edu.cn>
References: <20260828064152.37822-1-Naixumogu@whut.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Aug 2026 14:41:49 +0800, Haoming Gao wrote:
> Several independent error paths in the Rocket job submission ioctl can be
> triggered by unprivileged userspace. This series validates userspace BO
> counts before passing them to helpers with signed count parameters, collects
> implicit dependencies before the scheduler job is armed, and propagates the
> first per-job submission error to userspace.
> 
> The series was tested on RK3588 with zero task counts, invalid task pointers,
> invalid BO handles, and oversized BO counts. The requests returned the
> expected error codes without warnings or errors in the kernel log.
> 
> [...]

Applied, thanks!

[1/3] accel/rocket: Validate BO handle counts on job submission
      commit: a4569e3b2081b9d64490d425d1e5bce0ba2a74f8
[2/3] accel/rocket: Collect job dependencies before arming
      commit: ce9f76505618a12fc0d3b6d38fe51454de639842
[3/3] accel/rocket: Propagate job submission errors
      commit: 3185975d75f8e72f2db52e3e2ce73e26eb674f9c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
