Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94D3E316B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973343; cv=none; b=YhtmmxPPP3OiJVWydp/K4Q8kDgJjrM3UIRSWivRcg31/zekV2TEFcXDdK6L8if5jkIdY5Zzx+NhIofmteaawWI6SiaeJpfGJzgsBJjz3nEV2VAx+NZ/65O4PCifhE9cjv++Qdf+kK95DOdEiaKb8JbmXCIHetXdDka7nTgNU66Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973343; c=relaxed/simple;
	bh=sIj1ezOBqpeeSAMqVw7HYdm1cxc9CSBD5YyTXljllaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PX3PRfGZIkydcPX+XbxWO0EH5JJJuX5Hnwr9n9eG5baEm3g5O19QkWX9zXJ1qx0jeLdCLQ15ws0scgi609ImJer11aK13FL/KapMyuX88JtSoQKZaSiNa/DCBJw59vvYizvyYnctxlq4B7VbFDJgf9mnT8RTTF5oZ308562JKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl53dz4t; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl53dz4t"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so48418666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790973336; x=1791578136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIj1ezOBqpeeSAMqVw7HYdm1cxc9CSBD5YyTXljllaQ=;
        b=cl53dz4tNptD+9Wr73P9EY4rRMOunUmiyTLAdAj1jgAs2km/eYeKI6GoB79AzDSFjW
         /KAH/Ninya/7trsAJrYApMSlSdZszCgxs2hVHN+qfqp0jzTSVw7CX/6iu7lkO6XFiCFh
         CLvBuSg4sDXjkzITcb1WRlF7YUdlFJd5/UGywJhbtzzOzgkxlXd8Z55xmO4N/aaKP1w+
         kEoQ37FpCYV+HcqFB924T4zSE8R1CeEipbs0NLaKSS+CnObtOCVVDf3gADQhBojXyNcu
         5eWGo5wRZlYlqFeMi/alKPrYelB4YdTN+BCgqiRbuHtCcP7d9Lh2jKQPsPeeR1B0BDgY
         UJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973336; x=1791578136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIj1ezOBqpeeSAMqVw7HYdm1cxc9CSBD5YyTXljllaQ=;
        b=EGuVsxHcqbUZDmpgPXjgD2cKx8TDEti/O5eS7ejHGRDSMKGJFmYXJH2yDVKE0sglsQ
         stwQCIC5UTktBDlJidNcFZig/6Vx06H7hotxdohhVGyjKGAj6NL9nM0tbc1nm5+TfgTp
         ecUJrgL2oXgzreCHLBXY6t4KNeuNiChaDHMqUpkueJZV/zr5Vvo+mIwzctVWxJV746Lz
         03XK+iWU7xScQVVM77U9mkpsuSK8iNm8sckrjJ0IS35Tmg/ZTSRZz3wzg0eNObhGFLFt
         LH5vvZz9iG0WA23+VybnpbhY72QwuINuOBEN5EeyjzDWtWTdACABJ+h3Wh0W+0kS6BYG
         lG3g==
X-Forwarded-Encrypted: i=1; AKwUvByH0LnourneEqhyBoFFf/sZS4GvhdGDm9BYNuOlxnQnePJxnCYTDBWDo02xjCLGcgIaNHzCRbgxckjTlT0=@vger.kernel.org
X-Gm-Message-State: AFuF++kuM1ZL8ptrnVHJi+9URe3LiNVO6qGJ71NFLMa6OdcNrA4A/f5I
	REW1BMIZZ8uCSibR+OdSseNbivCpCNoFLfDzGGFdoEIecA7z+P06oNLy
X-Gm-Gg: AYBFou3FOOwgwb2wNmL9wYfaN+GkwNRtSidlbOA7xB0cOPdvKeSKWwycxqV0zBMmc74
	V/L3soMZ5aCQbAYI5LNEXc3laTKyO5j1vf36mscuZKZg+zzpQuFIQ8h/fCZpDNdyIlpvysdNA9u
	f8Ey2vGX/56BjhsR1S3MLS7LuL7Kj6edrpQvs/5DBJJEsAjfOSpBMoAjY3l7B5LLBaiRoh6Ka8Y
	vrt7ZAdPgsubkLAjs3zPMiJypLtgJRO//WHvkDcEKboqyK7HPEhvcZb++rUUz+GxSABcBpx+t9r
	gFcSga7jf9K6r6aLFZQTVy62GAZH6jwyiYUVT90RziFZnzItPEX8sx08qJKW2Z3T4NKJgOM3U6c
	P0weAzduP8p78tefuws+tqHmYRH/E6x0lD06mYx+MuCaiu1+xAHASFHguxDGvUgDHMMfgjgwkWS
	Y9KvQ+39pDwiuZdnFaBxtOE5RSHDlNfW8prv+tevW+3yOJ07aVTAzbNus5kBJ8qoqutPJ3U5Kl/
	mSgD74qUDH6y7ntQVuo5EGiLXrD9gdayypxt9Ip5lk6LU0HKtAuWi9G3GqDC1jGBaKozYaGjIif
	9EPIpTlcrbradf05GxU/mZyzFQ6eppQeOQ==
X-Received: by 2002:a17:907:6d0f:b0:c2e:4196:b167 with SMTP id a640c23a62f3a-c2e4af2bd94mr289331866b.18.1790973335924;
        Fri, 02 Oct 2026 13:35:35 -0700 (PDT)
Received: from localhost.localdomain (83-233-130-206.cust.bredband2.com. [83.233.130.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4da9dfc2sm127854166b.5.2026.10.02.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:35:35 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qca83xx: read resolved QCA8337 link status
Date: Fri,  2 Oct 2026 22:35:22 +0200
Message-ID: <20261002203522.1219-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <7eed302b-d455-447f-9ce9-f15468b9792b@lunn.ch>
References: <20260928220749.857-1-yongzhao.derek@gmail.com> <01a62e77-6c4e-4665-ba46-26d12b1c77b4@lunn.ch> <20260930212348.1919-1-yongzhao.derek@gmail.com> <2ea832eb-33f4-4bf3-bdba-5d983038d012@lunn.ch> <20261001181634.1508-1-yongzhao.derek@gmail.com> <7eed302b-d455-447f-9ce9-f15468b9792b@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

> The traffic failure was however because of the error with setting the
> DACs?

No, sorry, my last mail was not clear about this. The failure was on
a QCA8337 user port connected to a NAS, not on the IPQ5018 CPU link
from the DAC investigation. With the same OpenWrt 6.18.52 diagnostic
image and unchanged DAC settings, switching only that user PHY's
read_status changed the MAC speed from an incorrect 1000 Mb/s to the
actual 100 Mb/s and restored ping in both directions.

> Reporting the correct downshift has nothing to do with that, as far as
> i understand. Correctly reporting downshift i would put to net-next.

If net-next is still your preference with that in mind, I will send
v2 there.

Thanks,
Yongzhao Chen
