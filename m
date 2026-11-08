Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158668;
	b=FhK3bxEXWLYHFcRXhhQIT22RxvCcvf9iQSCdJIOUxnSCl6qMDBf/xe/8Nq/FlWM3/cGO
	 XLVTt1lOwhWkkgpKNXPQ1C6l2gY2bMuTK2cIINRuOznLDJ025dnUSXGyy6TZ0X6wz56S9
	 U1+mFPG8tJV77qXITx2VTRXtIKCw36kX+tfXyPISefSP4Buu5kacOqmh3gPUQ4nmoRN7K
	 w3JNKlMvb36Ua0OKGsf84NCoCv9B4naQLxT0H4DmpouKFIhpfXYHXNihowRDtdf04l1UT
	 dYF2ejl6qwy7PdoNnAD2AC3CxBXzXf+y87ACHWqFvDjHIIiWOiORpq5cVNp4MbCzwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158668;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=bjVp+HUbzA/Lgbq++P54tPwiDYE+SBr03kvXoQEBCyU=;
	b=zZCMEjFqqYBaAdW3romUs0qDt7YcMSyo1CRl93szy6rz46Iqon1kKL31K9HHstRs3YlW
	 zKVK4F0u42dQwjPpNg6PkT9pehWg5HsHjLJYbZkv1TTFxCdgIBy12QBLFaKWcE5twZ1c2
	 LtKyqlbtCZfTXL81WEOJb3axYApjQzsIe6KwcIb8PUvYN/SDvvdjWA6ObAWSkz1UzBSh9
	 a/nAONBNK+kMJ/G35ddJNqJIGdiTFiywjCDt+aQiDx17WWBgodIYSPl3u/tjWx1aF7c9k
	 4OC1elMWRS9G6IOb4h20a6LFM7mf+obnq68uyWKexgWOBA31i/aWiQYoL+8wwzlHdRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fOn3fbF+;
	arc=none smtp.remote-ip=203.205.221.164
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AE606D805
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367AE606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fOn3fbF+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158659; bh=bjVp+HUbzA/Lgbq++P54tPwiDYE+SBr03kvXoQEBCyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fOn3fbF+tw13Z+LzLbDF3woeXSA5Vgqi0sfJ73VwpT/fX73socTLQEIcZhNiVxExG
	 JPdED+cjmAxyvzx9Vb9nMXfkWMv3eI57ao+1ONoAREJe4ygc2rlCxzwWgt1zFz0FIg
	 CXwR8PDGvUKRTeTdhXWPjUTKcLUP6A912wqOcZ4w=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158657th2asph27
Message-ID: <tencent_78E495AE9F132060D92F62A55AFD53D11F06@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XX3wTgYm2Oet+EOHhLq8wp1QBr7aBuMRLNB+MVSzEfpvFcUmNLu
	 FveOkst/ipKSI5FbCPC5/heS2MxhQngvg55HRZLQSbsV8N3jSGOgPWQPgpzr61H0KSNoFcBsTOnK
	 /VAkGXttRFwM+4WjwUdreR9Jd/v+8nIb6uUXQkPWfy4NrfXyP3KQh6bIkZZpOwkaqAgl2nnJ2ZtC
	 su0vUqdNW30E0k7RNglG/PFlw4YcBKCUyY+f2yU4YyucbVz0yUrQgCp2bqyB7EWWbl73LXpwGf8+
	 gwWSaAzvs1oiSSk5A3Lf0/5YBHwFO5Hkh9Ia9BTIR/SWJ+6fykZLhQgscS39BJu5nNdUtXtExmDj
	 NsTwpyrwWkkVy4h/unKcbDMdOgPMyVRfg7Yu9czONyBMkDtAFK5N5s1L1eHoX+dmkB679Cfcf1eA
	 +oJDPpQ5R+5SgJsUDlUIL7KwHBBxYG43GSZU7g0kmFjwVy6Y0ldQlJeIfzfWn46Sq5oTPQH8U13S
	 OpqkmkIesjxEGJGTmO2pq4TnSFWolTSMkRSTZJvmOydib6drJn90uaOwlsS0yYAm4zy31WsBgO7E
	 Yn322rD2YfFBTBgwPOVWjn/rOV+xK62VxD3EOjZ0KKFFwWc3aG0SGbz29RzTW3At14gGvCIZn8Rb
	 iJNMolkrQo85vOXuYLAEmsiu0P4JONpGcQxULkwSQa0bGRQP504l1UQOdPp5q1cEBYdkzEtWuv+e
	 mmRaOtrAcGrmt++9fx6horWbfYeSXfG20ZdRu/2/Ujm7fRvRrDS6nL1yedoMjQ4mPhsYaYlYfmz6
	 zEp6V9QwU/O+EGxtUuv6bk3njwqnSBW4c5aqtDpSTdQJTeaMLnoSdIYbFix+6mRgo34O+yssDSVr
	 Z4M0qheIUCOP6bX4rFzDqFfkaaARxgHrbP/gJBaPK8UgQTWcgi4Nnl9GIbQb5uLj9ADX0SgtaMQ9
	 ldIvRRem0+EithEEETTXP1n0xRT19tOoIqyJCEDLXnj74TdQzuTR0rUuIY775TLaWxn9CWLRP0Uk
	 buinCjPD10gPDvfV/MmjTSiOvyu1Ouuf7YMz8triybeQ1DINdx5SU0CA+4VG0=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Jiawen Liu <1298662399@qq.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-cadence: fix clock cleanup ordering
In-Reply-To: <7739adcb-4234-4e28-a010-bcb64605b5af@wanadoo.fr>
References: <tencent_2EA9016EFDAA548AD4D717D94396E93A380A@qq.com> <7739adcb-4234-4e28-a010-bcb64605b5af@wanadoo.fr>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853266.5.1212006816497262775@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Christophe,

Thanks for the review and for adding Alexandre.

My description did not establish that the existing clock-disable order
causes a failure, so I should not have claimed that it leaves the clock
framework inconsistent.

I'll check the clock dependencies and the managed-clock option before
deciding whether a revised change is warranted. For any update, I'll use
get_maintainer.pl and prepare the patch with git format-patch.

Thanks,
Jiawen

