Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772504;
	b=kO5j6D3+QMqX693Ixr+DxGgeuhaqLzZqvQaadvSN8Bunzq1DD7Y819QiqvfQCFVlzYIl
	 Ky+3ItBfL4hUTVdnpjJzdO5IyhayRN//BPDgA0f4XVSJuJomBTRAibCWfT/6DbFvNtN56
	 2lJg8RzNR35Cl4ViVUTtV1V/knxACTo0bOJ+ocSmJ2AMDSTgHFHdOaNrLuWAlUPcjVgCp
	 OXosf9z9qn2gJtsihpH5/gVJp8MSKqf4AIDCzo4TmCPVxFoLCrRuk1EQrawrq0tViSuOT
	 3FRISOnSHS9jgxhWF8be/7qgyMdDcxiT2UHHQG5B+eeMrBhktvPi9bwm6/EpT/Ugi/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ObpDvAOX1klXfqsSNdhdP4hJ47WYvmcb7PIfyXC1CRw=;
	b=npbKlbKgjuZbxDZB6sBrrp1A0yXLxrdhgvrWs5UHNppJQaamKPElkyY6ANO3hw4sKGFA
	 CP3nEw1K6WD0Gn6Zi/SDJspwdFOqx273R2mNoPc15qKwoWemEXehfFnkQulZTMCo3u1LI
	 T/n94mo1TEFkcx6sjxMJleFjNAH2PlQ4nGMwPbUCDn+0U5TEoPvDSOSCo4WDjBZopuwSj
	 8veSmmGaVxjLsw5C5f+Wkfc2DC/j4OIJyHeCb+PYh/ekz704wAHetC3p5LOROvS5EbMIR
	 LiT1JHuboFymN59nWbtjdm8RLYHsmlM48+bafoznKUkQKisDNh2bZJCwFR0LTznDPyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhBIX0dc;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0851606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0851606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhBIX0dc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so643254f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772502; x=1793377302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObpDvAOX1klXfqsSNdhdP4hJ47WYvmcb7PIfyXC1CRw=;
        b=qhBIX0dcQktnNgcuhUOneFmHnNHKpxg+fYyk/FDPz3ae3Xmty8XA9sE9NJ4+d8lNC2
         ubukkbO61AOfg50nn/TawWQ22v/v/uhgB/q79lB1085dthU9oFX8QUCkem7s53SLDra7
         9xNt6zmk+iS6vIgX33fVpkylI56664RooxqhLUp4Ljcxz5ZjikQeNCpwBr0J7y+R7cy6
         OvPIKf3vkIdMe+0ldpc8O5maz3nEGV/qAq0q5KOT+x5x7Bed3TeV3b6OHgC1KzgkmP+H
         QzUjSQyigkx3VCU5aDPu0ZliEEO4CjZHH2OBBURVgloB6/+5apqO/Qu++l+c85QlZZxZ
         gfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772502; x=1793377302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObpDvAOX1klXfqsSNdhdP4hJ47WYvmcb7PIfyXC1CRw=;
        b=G3NepBkRGySaWfHwVUx+07jdJWEBHUT4KAFRA0SbLqLrOFqTQWpBpaNv0KcHxqGSKb
         vjRGtp+9hrprWhsb30oxeDeGCDjXx19uLC/pRRmNQckBKXyjsZfIWO/sBxjD7MquPXjM
         TCfs1O+LTzSYVpR0xioDb457tQvRPXuZZZK2TKsutQW14mPsJS1Kw+wpcxOMUT7l6TiC
         oIbChKUtkKNCkrornS7dy4fc3odOGwhCqBjafF1RmHobwGdFEGKXtj58Gc6CclBhxHTJ
         0S0FYZicTGb4I1wWAOvVzCM4A/rTEz/CZwLmcJBGksS63FFoKXVfK9s/SeHsm9ZKziSk
         EqDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHcYP6qUwVxm4wTjZztNi9yqDxB1gjcIi+Wog8PPc5IEyfkZEEZSvxQGttPIQIbSJKng38pviEqDKXtWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0TLMewZrGBKZp5U28XKcGI5GavcAlQUYtz14cUzcXcC7Sc1yX
	zv1o2Sf/Jj+lYWan4bkEFV97aCjkenoY8dHLLJzNqHrUL3eNC+3dhBrI
X-Gm-Gg: AYBFou3j7NBUa5VpwgJL/azW7nO1bnXNBxGCTCM/QZ0JlwsJamj4ez87eKcYSmHfJpS
	yg2SNKjc+lTpsgkxDkDx6rTXrzH+x6SSsgqsH71Aej5z2TDJgOg1wiDusWGyC64X0g1i+ItpDWW
	3NJQhCJKJJg7AHMCV/Z67hILTyTZ8IQwV6xvl7Im+DLF6qYdR6e7EYH5F8iHQkv+EIfOLXiHFZn
	yjQyARFdhZ7a0BtHdteEc0lf2gbpgXK3x3CcEAyGVGPqUbP7fIJTLODCbQGNM4n9BIiL/XHG1Bc
	meIJaBgnC3JEE6QyFNyVMuOcSnLhVeXeqENSzaia3xV/VcCrfb+CHAJUkQeTQ5rOHkZefFSBs1C
	K5W5BrlZJcg/cE7DOIBtJp+yoQT1Mm1pXqoXZQq8XCAfE3FZYUu5i1ZU635uxMIkyM60E4NtrV7
	QHW0dUXN8KbRgPg+Si7KeT7O4DfrYBmGuj8Lt084R+v2L9W1dH9dY5+TD9JkCWY6aTP37Ev1zQd
	8bgtn+NY2h6hGo5Pti0WkaS023jI+NjoH3bebnU2CK62J+kkYhLvvvpTJxgpw==
X-Received: by 2002:a5d:64e3:0:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48e385a6690mr4354135f8f.27.1792772501780;
        Fri, 23 Oct 2026 09:21:41 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm901583f8f.8.2026.10.23.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:21:41 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Krystian Kaniewski <krystianmkaniewski@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-usb@vger.kernel.org,
	Brian Ellis <brianellis@gotenna.com>,
	Johan Hovold <johan@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	aichao@kylinos.cn,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	stable@kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2] usb: gadget: u_serial: pin ports while TTYs are installed
Date: Fri, 23 Oct 2026 18:21:39 +0200
Message-ID: <20261023162139.3308-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022091359.1187468-1-krystianmkaniewski@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krystian,

On 2026-10-22, Krystian Kaniewski wrote:
> - Do not carry Mehmet's Tested-by tag because the registration ordering
>   changed after his test.

Retested v2 on a Colibri VF50 (7.2-rc1, ACM next to NCM) with a 3 s
delay in gs_close(): freeing the line during a close, opens of the
retired line, re-creating it and 4 add/remove cycles with the port held
open behave as with v1, every port is destroyed once and there are no
new kernel warnings. 3000 opens racing 30 creations of the function all
succeeded.

Tested-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Thanks,
Mehmet
