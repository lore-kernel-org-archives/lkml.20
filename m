Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590693;
	b=XQo3BOgpK0Jg/OL4pqIFCYATvWno42b5k6ADbOuWMzEE5octYu5YpuGZaXZ2RW2ujnlH
	 tJ1KUlrRQW0jfVbuvwYDFQ604GS3VV0/A/zS3VwzReU0781XwkCqgePwYbLCP6wOKS2V3
	 aMTcmaPoEcALzp5r5QVmj7nngm3X5kk68b2H/MRzqcMEg8B4rY0Ghu4viuUH/x23ZAEqF
	 22HjzYhYvVZ2BTZtRESdpPVFIHNkec7WaNJLYkO8M+z6Uo/YczLsDtaKXpC80oLv8h5aU
	 MGGbi2APCOiQdGtTnQjvrB2xPl9RA/iwjiRXoHyMrANlofg6qeUoLcD930yXEDHVpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jhvgUdLmcuXsITWjIdcJRYEzmc5gsWkSLbwzyqjpaKQ=;
	b=wpQ1Ld9tDgH9kKE7yGlIv4wKQ9n73+ZtWMWl70OQl90+3eWCghubGDww8K2stoP6E6a6
	 Uu+itlQ2Jn7OaRBstnEUAf8FvG8wtQTAgx9d5hReEDAReoFGY+8mq7wq8uHnQe2lPcLDe
	 X0V1u6Ou1sD7pa9YyrIJKle3+CkOItTFTPmDUMm6mdNjf8cAVzKAeTUIxFCartFhlcLCf
	 tN1guGh4a1Tt4Q39XKyHQ7oKX498fjRnnlQElq59QJwP06gp+DSRmxnk72M5G//ySeHUF
	 2Iz3HMaBQx7nR1lEyfnlIIl+GS4E71RmNVsWCZ5s7wvP4Hz/WBGAYt1AtGbO67Bq/YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQrCFJdR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F68606CEEF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F68606CEEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQrCFJdR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6995435e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590691; x=1795195491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhvgUdLmcuXsITWjIdcJRYEzmc5gsWkSLbwzyqjpaKQ=;
        b=zQrCFJdRfXWgk8OEv5Ax3gtXyhelKidixwQgbs8Z3wgrmQNKJSG+hQy2EIG3PC1slW
         SrwyIM8jI3IameNVYvgy1hgj2zI3ur82hmv+IXAvvJLT+Jguu/LYIhr9Fv7g69bAVdMJ
         a2NJe9dmxTq5+yjfvafzpE9YQOM4eyLvCPubAQWf6DOyswLnP5LniCdC4oYk/WGOhj0p
         UrNRv7NydQp8ZkqAO7S471XxfADkqUPAqE+B2l+U1xZ1odWIlTvYMyF4mLfG/1YQV1ne
         PGKuwYZJuOAhAqC3OsG/zbOwkMB7z771uGSpaxQgmHGWKfUjMva4erzXyrd1K/WazGzh
         e2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590691; x=1795195491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhvgUdLmcuXsITWjIdcJRYEzmc5gsWkSLbwzyqjpaKQ=;
        b=Y007lVP6tztUchSu8UBpnnVe6H28Vnj4It92V5hSd5tRVwkuoYuqWgE81iWQylZtE4
         rjJ7VyjsigKkm1LPhl+u7MNEB3yccuunVeeVfDEWnlKKEsIHia8xItbdT+jg9RIIQ0Hv
         UJC2xgCqLveLspGuArRfEzWQ2EjlSluRqmXcK2vQwe0REKKQwtdPEa4oo0T045RnXiZh
         z//mRJkT9vxv519YEj7aZ1hOEy098ZQBAgp8LuLxdspQmZ9x3PMkLQ51qdGndqOjVfqT
         NEIY8BnQQHk3Ml/JbAUk/pnb9CfpLT9uL+fWS8z5dotO/n/9KCc1c5PdWS9XDhT7/QW2
         WkuA==
X-Forwarded-Encrypted: i=1; AL+hErFwvvsvlYevCTdtN+r1jVx/HeJJeBzhLrh54v6osSyaikCOQL64wPCOIfZGjT7LRFPuS8qQ6R0l51TLihc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uUoVkJ/DCmyjZ0XJjbIqo8cXwz1A9iPD+02VDZdMWOUqFMITU
	t/rIuC1DKCkiKvw266MnvTKeDjq+zn7I5tjYrZHdwljfPdibeihXlm5+
X-Gm-Gg: AYBFou0kt6nBOe/oGS1JGt5s++mJ4vNXkskzeVOEPspvL6Sex17mJbV6dkJDSv/rSP+
	zGT4uhxo7PA+s6CXoB/7+SDepLjSi1VVW5fzF3gf04JXBDHarjflsV4bp8TUG3iL7OAeENAluKh
	+UUTlVoXoLZcBaO8xQE4sZgEv8zEut+C+WmXxL+hjuARUc4P1DknnTPEQIScXM//G0JhdSlS+PW
	MMyDqmeFtcEty057+Gwwn8VQz2UESP40qd5EKfcoiBCpngGGrGrqYZ6fRObx0lijDq1pgBb2HSd
	G4Xp9JA3AWlSwGKdO8VaDXYf4GcEP0fYvCctwg8T3c3TrIhldNNOTJPtZoGuIWpNTGt8gOXFJML
	2eGYouqdBtFG+b2NztBYv+og7yCiC9lvlOFg1qyHwRE9ukR9HyfL9t999v2U9PhNgMHnobfUCYb
	VUA4tTokMM3j3VPZOrjrLCxV2UEaCs6TfwbNwKtmBh2IXbpomFR4PJW5DGgyS+CAzk8z8Nyy+V8
	/QJ2cZe5pLP7spJD5cZ12vZRDpP+97exbHXF5KqGispISHY48NkaDNajOFaLC56whEaaNbrfAgS
	b2EHGLuzZuqRvMa2xifrbd3QNWIv+UTJfgs=
X-Received: by 2002:a05:600c:6208:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb55a66467mr63599825e9.25.1794590691155;
        Fri, 13 Nov 2026 09:24:51 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6033301f8f.21.2026.11.13.09.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:24:50 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Fri, 13 Nov 2026 18:24:49 +0100
Message-ID: <20261113172449.3313425-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5FA04DA4-863E-46D3-A993-5F3C074ABC37@linux.dev>
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

On Fri, 13 Nov 2026, Luka Gejak wrote:
> Maybe rtw_fw_update_beacon_work() could skip the download while
> RTW_FLAG_RESTARTING is set? The reconfig downloads the beacon again for
> BSS_CHANGED_BEACON anyway.

On Fri, 13 Nov 2026, Zong-Zhe Yang wrote:
> How about adding a flag to indicate if this rtwvif has been init-ed or not ?
> If init-ed and rtw_ops_add_interface() again, call rtw_remove_rsvd_page() first.

Thank you both. I could reproduce it: with a test build that queues the
work right after rtw_enter_ips() in the recovery, v1 gives the "Should
not have an empty reserved page" warning on an RTL8822CE with an AP
interface.

I will take the RTW_FLAG_RESTARTING check for v2, as the flag already
covers the time from the reset to the end of the reconfiguration. With
it the same test build does not warn.

Best regards,
Mehmet
