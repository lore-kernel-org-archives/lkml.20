Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95324EBAC5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633360; cv=none; b=hK4yvFdRuH2OF5BQ/IsfSD2KTiCmPVzpdMmVFQRk2NG4JKSPwUPO7h5csLzr+DfvGdXVthGxyRj6q1ZzfdI40ZzBwozwPhKIGK7XWdzwU7L8BK8/lBL9r11ilaKISdfvf8o6bcCowmYFJ3Ux6KaVB/Hrd4nGZYwEMNy9pLQUNSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633360; c=relaxed/simple;
	bh=rZpmAD2x0KQnc/mc298y8EsNAb64mlW7AF4wYInWEok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3frvZt5FMYjWKGbYV3nPGP2f4MnqijNA5lAONA9HSfSuzVslmpRXL0jbVuOhz182TnzGnHGgyiLp/ZzT7j7OZxlW5TAnODBpxVXQFPSGEi53XuFHUiQ9O5V98mfX/CSSDvV83Rw41mqUlc+NmjUFKbQM6FQK5yY2xxhQ6y3nTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qT4t8M2b; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qT4t8M2b"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so550983666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633357; x=1791238157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZpmAD2x0KQnc/mc298y8EsNAb64mlW7AF4wYInWEok=;
        b=qT4t8M2bC+oDpuJX+btxKlouHWBNUN+PaROBkJX8eF4+ZLyL1w0XM/ACDzV8KPaa/Y
         lzLVpKP3S6Q8QSllo7MUtzTNmiXyp3j2aa7TBI/T/dy1zqplloXaEc0NA2jmtzg22llJ
         k2eGzZMG7LFi2I8EVFw+VH83Zke9dFTKfWcaMkY1ULvEtOQT9+KPYwCzLsELdtQI2uhA
         ZC0T4KKNzaZbgp63ubJ8wt/C/vel/7crtoBAcOxziNUP8QKga1LySeKeylNg6TsTp7eo
         3+3UwV1D7XUOYl/3faMCacLx1lv8YrQz83xSk1F5D3fJhuTG+ced26dEuFRfN0VTiXKL
         b5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633357; x=1791238157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZpmAD2x0KQnc/mc298y8EsNAb64mlW7AF4wYInWEok=;
        b=l2UcboyLnVHNJARzEvTWbrY7rfV/6EDMHgUuJ0OByqRYNhP+iMHGiBDYvA6IXvZVKA
         L4jajUHCs+1SnboxQ/5Ya1Hh5Tm2trhexO3JVWJ/ioNsdb6Tsu9vHU1z2kXA3nfCgkIh
         sv+mRQKx7ni0RH7Sqkgp/j7Xgx1VqZG36WufqSJFe6tMqb3I0QgmphK0aGX8oDaO/Izi
         FcTFGl+ukQyKjJNyjUDlQ+sVbiW1+/ffPK3Ah6c6m3fYi7tqz0aTRtYTR3/OvPGCskWn
         W3ZCjvIxdPDm7Ycl5oq+tN3MldH0DIoBsM6ZIVA3zxoAted9AdNyPob78ypdCj/CDrT6
         doDg==
X-Forwarded-Encrypted: i=1; AKwUvBwyvZh15vy8k4gCDulUc2OdOZ1IcQkRWPVMQ+8cWajanjhQNCYwF91ewSxaX5sBTlN6EB/yyjriFMIhY7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lCZP2b6bBXlbuAKdn+p4BfIQOaHKlOdTjNUnTwgreiQgvakvyW
	Br+1DnQhlt1mM1rZE/Ez+9rtxfMPz182Ub5kB/+vYvR01kwIiduVw13S
X-Gm-Gg: AYBFou1RshZ52CsMzDNqJQ3WCJLo2DALXgrzmwZST2TYpjbNVksZvTPNvX3ta/So1qj
	oWoxCMpwyhb2Hjj41Wh+8MkcU5CF0x0cwHF8yR6ILfjGAkRdT7UzpQK3Ya3yp/vV2/UUT4ZlO0d
	3nGafSdab7dsU4dq/dOCNT7X64g9/MQdBL0scI/3XdoJ0UN+/KyYTnQ2qAJHmi7dFBNWCQoVB/A
	wPF+R1Qvoq0ZDebbPK56LlwI6Feunu8E3uH2HLY0bfLXBUl++ZjsTpFbZndG8yDRrZq7WEYiDmY
	SEbyyVJAOUYBNXePZa/yK/zIG25UkUIFWQQGXleavreI2tMRT9yiPfLNahYcMCKqz7EnpLCedir
	69w6+yPWxZEhEZMKKNvV+Ui771oO/EavzuRxR/Avmm1ifyHZc5FqdUfVVka19zoj1Zs9MjFwDZ4
	4Trt3Xuok3jmIcl4HjyT8WtviwphiTpXlu3HAXxyo7ORFZEWKEQDEPzi0vA7VYON9xrJJA4JG6u
	D7tpstw8nacgYgiN3KlUiEQJcY7aKqIKuspqK4ns8SGzIvs2+gtwSwe
X-Received: by 2002:a17:907:c24:b0:c29:f5d8:9c7d with SMTP id a640c23a62f3a-c2ac22cad65mr1258773566b.44.1790633356629;
        Mon, 28 Sep 2026 15:09:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7352336sm533842866b.16.2026.09.28.15.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:09:16 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	ansuelsmth@gmail.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: qca8k: propagate MDIO errors
Date: Tue, 29 Sep 2026 00:08:58 +0200
Message-ID: <20260928220858.1982-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <179054715863.3145.10179961093285192493@kernel.org>
References: <20260923215748.1336-1-yongzhao.derek@gmail.com> <179054715863.3145.10179961093285192493@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 22:12:38 +0000, Sashiko wrote:
> qca8k_mdio_read() has the same pattern. Could a set_page failure unlock
> and return directly, or use a separate label, so that the MASTER_EN
> clear only runs after page 0 has been selected?

Yes. No transaction has started at that point, so there is nothing to
clean up, and the write can hit a register on another page. The next
version returns right after a failed page select. It also invalidates
the cached page, since a failed page write may still have reached the
switch.

> Doesn't the same outcome remain on this Ethernet path? Should the check
> after read_poll_timeout() in qca8k_phy_eth_command() also bail out when
> ret < 0 and ret1 == 0?

Yes. The next version stops polling on the first failed request and
returns the poll error or the timeout, so qca8k_internal_mdio_read()
falls back to the MDIO bus. The same exit path also leaked read_skb;
that is fixed too.

Both problems predate this patch. I reproduced them with a userspace
model that compiles the driver's own functions. My board (QCA8337 with
its PHYs on the SoC MDIO bus and no CPU port 0) never uses these paths,
so they are not hardware-tested. v2 will be a three-patch series with
one patch per issue.

pw-bot: cr

Thanks,
Yongzhao
