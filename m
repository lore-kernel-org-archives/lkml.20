Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843323;
	b=szmqY09FF5qg6X27TMFDOPyzNhdvdKGlzXgSOmRt7HzuRxjpmbp7dB7orth5TNAjH1Ck
	 iMcysXfD9sZwzgOpaf4D00ryHArVCU/N97L5glTvtZmvceHiobE295vMuuE9Gf7WPj5hj
	 3JMMdt65erUN+KyTI2MI/A3ZnrM86jILj0mwhYLIXgBXMVaottr6li5qIcScr7irP1rs4
	 uEtd357aOhGZ4q/NnSYTawtcvIAkF3YLbjH4Cg3SymGz3oqrY9JHWC+P6H34yI8u00r8x
	 w9ySfU3fIDu124YKHQ71xC5Wllj6wpz6oucwy+sCcx/UGJwOLIbBodihFckEFLSXOqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843323;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=4aOMTTBZR1ErUxEvB1ZFzGz22JMPQUGZDxbq8pbmpHg=;
	b=bw97A00ig+7+OQVVSk4aL9Ywn/vhgEoHJ+uge2I33dfQMPzRbFX8V0kl0b3h7r9Isi73
	 wKLDIKtASSsnWDbUuOgZMQOUFssB56uSRy9rkPxGsyTjccZNm0wqbVowjOYoIe6oAEWdY
	 ewibpOL+uFpbXH65/KBge8rmnecbHK1ANLb84uJnPw6XQcCwTaW5ogU0RipQ3XD8V020i
	 pO5PHc13clyMUJLHK9j6F3HGUL33a12igufCi/lv/qq8GSessq8m1PXbjUb7cs08hV2aF
	 OhsaA/Ozdbzf4Fh0v3IIn4Mu19/mJjAIoJlqkcAbx+Bn3tZNgaFW7lHWYm4tL98L5fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=VXcLlK1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D6606A31C;
	Mon, 16 Nov 2026 15:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=VXcLlK1I
ARC-Seal: i=1; a=rsa-sha256; t=1794842918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j3PPxqC/blelrGTVhCr792Qhi4y1wsj+39F/KEcX5CCLDekdyLh4c9YUFzFnYf+gETIeEf5oDf6otmwvfjyPBTjsa7lV5gqpI6Img1yi5/O3vErgTBX1dZ+tDWgPGC1ZUBVnOMdNjDomlqx4y5VDwkgc/L4L0aZtBmT6CrE8wsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842918; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4aOMTTBZR1ErUxEvB1ZFzGz22JMPQUGZDxbq8pbmpHg=; 
	b=XqG12CPg5SDszoVzpVZX+aEE/46+oAV2hwnS7VYe9CCmBYBhv4qBLDqyYnLfd6LljIVcPuF7aDE/gKNWc0A2aWqSIWT8bvK3MkTc7mU0PF6VkyMY6RdHNoje0yO78VZpKa09uSdkx8C2TYACNAwe29P0xTSJ4QDovfIhRyyihj8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=VXcLlK1Is35Ja4S0OZGkl2VGEbD/Ue5brR049JQOm+21K3lcU5/qc4V4GBV9j8oJcV39/CFgUSO0JDnnN9DlvLYsIdPG5WjJR5q1bNnR4iO3YJINOELt0F3Zp9wDIgT/Bgn4rymwg0zqzEX4CSD0qBTKDPngI0J0aMGVDK1K3yscQnob7LAcHrzRmc9Fsy5BGW+cRl6fernZsqaVxwdZ7yd2xv8aU+ozovoJNZ5asK7e1hae4MP6+dB2XsW1aVW1U6VtxNMyFHSUlrvdf024vudTZoyGhg34w4rEfdkYuBN04GdvoEE6tGsQzxDFRznXwXBs473Bj39qSGqAUlX3rw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=4aOMTTBZR1ErUxEvB1ZFzGz22JMPQUGZDxbq8pbmpHg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842916732904.5678721982117;
	Mon, 16 Nov 2026 07:28:36 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Mon, 16 Nov 2026 20:28:03 +0500
Message-ID: <20261116152804.781-13-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <a7c3ba85576b43ff99b7ffddfd925014@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-11-owner@ph4ntom-rev.uz> <a7c3ba85576b43ff99b7ffddfd925014@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Mon, Nov 16, 2026 at 07:56:25AM +0000, Zong-Zhe Yang wrote:
> I think you can just call rtw89_set_channel() in rtw89_ops_start().
> And since this is more like an improvement to UX, please place this
> patch before the patches you add features.

I checked rtw89_ops_start() against ieee80211_do_open(): mac80211 calls
drv_start() before ieee80211_add_virtual_monitor() and
drv_add_interface(), so rtwdev->pure_monitor_mode_vif is still NULL
during rtw89_ops_start() and rtw89_chip_rfk_channel_for_pure_mon_vif()
would be skipped (and on chanctx devices rtw89_set_channel() would run
a second time right after when the chanctx is assigned).

Setting changed |= IEEE80211_CONF_CHANGE_CHANNEL in rtw89_ops_config()
for no_chanctx as Ping-Ke suggested runs after pure_monitor_mode_vif is
set and calls rtw89_set_channel() once. I will move this patch before
the feature patches in v6 as you suggested.

Thanks,
Enver
