Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963815;
	b=VGndXU9u5IKp6R4ITr3oBRyZ1YxRKh19SINrrtUseXipoTeEKzmfdPn7dSSu1NWEHAJw
	 qgF1ZQYiaWUhK4OGhxECT5XRI6U0Mh+0x3g+WuPOjaUxQZ2ePTmDzAXwRlmQCKBaTUPih
	 9+dClWzgM/xkMhercfMejGqH7E6gtd7pEzoFm1r+e1j+rwQ6JlBdAbw21Og/D0CC1eVNV
	 Vt7qP3BYNpH8Ra06zbTdqTQgmvD+NoiTmktl1Bgzmj6oHUxiA1qIbAM96osnqEj7uMru+
	 d3/9Mqq6hvRXqxRY5U26xx8ED5C7mHjnJgxw/gklgyWOqkQbyyIIARyGaC6p5ECYbjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/2eFiE3bQ464FmO2JJo4VW5PfHFjibC+F4cl51xjGiE=;
	b=l6SwGyHr6sRRfSty7jcIvSCnCLLkRoxSzDbXWGDWa83clxjpMeojblCWMHONwTjpRu57
	 EDoGL7b6hzNx6UsDQcl7AtwzmYlBDqljtInu5/vqkDhsBrxgIhttXNX1U7aHg1EgNo/ri
	 Zs6RGrHUCZyqKbs0V/dh0fqALc4qYm8MecDk85K+/ryzjdNyXvVQlFcQ9fZZHsUd7DLMp
	 qTlSS+008YqWvRR5j9+UCBCFTiPIQZd6kslYTAmqiQ1+SB8g4X4wGZluoYLKimRCMUxfl
	 OsDZfEjUwGvD1cuNorfx1LM0pclXYpPGOt3XLnemzVXIXwQlohXZSMOeaTiCVUnaehg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fhCKYdsQ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063A606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6063A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fhCKYdsQ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso308871066b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792963814; x=1793568614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2eFiE3bQ464FmO2JJo4VW5PfHFjibC+F4cl51xjGiE=;
        b=fhCKYdsQ0OyMh6sfuOIAo3sWCrsg/U2CMwUsTWVoLNM6E4aIJSXdw6bxDKSvR4csCW
         E4HpFqoTo0lvGnx1G2acQkNs6fhk5ruW1hDejUFGLm/TqlCu/enFwrL79TAfmZmSSH8j
         zzQZoj3e2m+cedl/uDnFRFSNCGHFWaiD4lIuD58F4vO16fJxYTg2B0HGqUyWspn5902d
         KdN4e1YsyNdxzlA++oNeas/rKymOFsim22w8eVLmRbTZT46V22WHFoKCr67WKaR+WKEP
         XXKtSYgRO18cnwiUBo/5DC07QHztJNJBxPJHoq5vBif5AHhNVWGxWjP79WyCtd+90yMz
         4S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792963814; x=1793568614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2eFiE3bQ464FmO2JJo4VW5PfHFjibC+F4cl51xjGiE=;
        b=GmL4iw0t+UI87FTrwPFzpsDL5SOg9d4NxOylgoTYv7ASmSgfaZzEIGJFsegRVj1393
         7Y9U6Q+os/hSOwBPw0UHbnGXoAvz3HhURndTSPjZPQRwCfUzeEIFeTunqNhGmjfOMP3k
         LeTiNZ8+xmvElODCNsrNzAxHzo8p+FtLNbzIRHx5tGRLxZlMCRy2/mTO0usHiwpDqCdh
         v7o6oHHBb6WZKFESyTr91fPJr/yhz4YUjOkn5N1gH9BDc/iFp9jrpDpAsDJ8ekeRA5Mj
         0iCQRi4hHP0Sh23lDDVtkVa9xbTvTWjNVfIPPJO0ONIH/k9iyKgeL053L7n3gihdEVyf
         h4XA==
X-Forwarded-Encrypted: i=1; AKwUvBwRkocFDJYEDkvIeKlnD4ABf8AqIx43tm5e5qrD7g4jqQP7HmJgkgUvTJ5KLB/D/vSVvJ5peC0l4cL7n9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLryy9whz5gORbFmUtloXUCwgwuaRtRHoQtKFXMuByHgKL68fEL
	pck0tuKhf0jx8kZ6Hus12sZMm1C/RahDOZcTUUwV+tJvw0yHyT9iybWh
X-Gm-Gg: AYBFou3+U/l2mF6EduiyzF84cuMDHtZHk4Drd6D+GOVfLJUz0juHPWbrmnfpEqitgKQ
	stCSdcbpuL1WgziI5f6M8/sua/23Kxj10tRUFyMH4WHIOLuBOXHVUeNT1rl8OLQCjMCvw/LjGxv
	lA72u2OlcfMtktAHVvZL+dPfKbFL3YoQ02rF60mrWrO7OWSYRHLECoYgYCGEyC1wImOH8c0rhN8
	xvBOYgr9HI76yK1hn69ETqiESAgYy+/uKxY8ni4zdW+05d4ABn+CDakLTCJQ43PTzqi+U8XbaYB
	+c1z3BYybIBJYAoEw6iiSb2CpyIFb6+tIhyRuzB03ypI+yzEuuKXO/jVhTqtVKezBEo6bMEOFW7
	7D7qcB60IXpLFT6NNKTYPVzqkwF5XTr2SIAshw59eSC1M/oKnsSjbUIdlXvWPPZnCNVXrlykbMZ
	d7VB2sZVkKOmRUvPT4+RpF3Xd0kQTSjiOKJkG/kOBFUOgffdVnXxpcF1jiuw9e40IFbizUeQ7aX
	LUaFiCc8i9mOxjt3yjjZXk2+HYJ25JpvCFB2GbQ2LzB01OBJP7IIvxEKQoQYmU=
X-Received: by 2002:a17:906:dc95:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c46bde24eebmr627862566b.23.1792963813604;
        Sun, 25 Oct 2026 14:30:13 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm243556666b.64.2026.10.25.14.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:30:13 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/4] driver core: add device_schedule_reprobe()
Date: Sun, 25 Oct 2026 23:29:48 +0200
Message-ID: <20261025212948.11474-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4ffa0608d32b6a68e064b41b17b6d35096b9a7fc.1792203271.git.daniel@makrotopia.org>
References: <cover.1792203271.git.daniel@makrotopia.org> <4ffa0608d32b6a68e064b41b17b6d35096b9a7fc.1792203271.git.daniel@makrotopia.org>
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

On Sat, Oct 17, 2026 at 08:56:27AM +0000, Daniel Golle wrote:
> driver core: add device_schedule_reprobe()

Tested on a Dell XPS 13 9310 with 7.2.11, called from the .restore
callback of hci_qca (QCA6390 on serdev) to download the firmware again
after hibernation: the reprobe ran after restore and Bluetooth came
back, and s2idle suspend did not trigger it.

Tested-by: Nikolay Bryskin <nbryskin@gmail.com>
