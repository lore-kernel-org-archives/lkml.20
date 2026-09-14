Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1D47CA73
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395944; cv=none; b=cIcGzwB3RIRYTMjf+ytilsC50cbk1ln6Vn5ZVjiMjCLgnma6udUg9bKoUW1fKIS/zf/kP5Wqv+glnbxKNT2/0rnt1TruLhnA3vXAc9EQlGPl44omRrhaXZeNq4FvGV5zVTuy+dU3etcZFzxe90Q8CU41Jq2q1S8LPqjAJwqBWpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395944; c=relaxed/simple;
	bh=yWBz2u9MZyDcGdapPsHVrPMmzYjBtuHU9QqFvO4VM2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CCkwa9GkUWBeDGKkDD765tD44hy82utSG9NhoulUzf0HwoFAUHGD23k0CedZStg0X1csNP9V89gjmtwV3gn+YoFTOxHu1NYBllWPiaGnOMPM7spp2FFxlfcJ8U3XDKVSPAcI6Zs2CWgruZ/JKPAt00X+3eQHKlLMLdBD7a64L88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctYEAbmK; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctYEAbmK"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so3454545e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395940; x=1790000740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yWBz2u9MZyDcGdapPsHVrPMmzYjBtuHU9QqFvO4VM2Q=;
        b=ctYEAbmKM1zNZHrU+XV8igxUqmTrudmqtsAV9iCQ5idk1q9DPUALKlbLLxYJq104HB
         iAO00ldDfwowENTn6muAiDNaPXUaNirdLHZrVdmccEGDxvTku869d+6++DZi6gWUxqPp
         wmmAHvM6RREDOdqcCjPaDsPkx58pphm4oMhPLESQjUCLKawdRCUBxtsr7+DkPOGT4X17
         r6zmz8fZUTlCbIRVNwkBk+NZBVmqzJG0PoGeZmen7IZb5G+wRJ241TsFPKtY7yT7X1/s
         eE5cKHHkuJbc/pF+WYh1/88WYCbvt7uNZJ4lPIMyxwbVRVb1Hh5MIVbutKig4B/4S+Ve
         h8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395940; x=1790000740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWBz2u9MZyDcGdapPsHVrPMmzYjBtuHU9QqFvO4VM2Q=;
        b=TUZYNEh97wNI86sFXGZ4e6ZFtXr58IrQLq2bryfkqDb1KZJHlo53qkbwMr9zmaBOBW
         r+nUCY0FSQmLcFn9sj1qPKlbwOaQVMFaM++WjktY3oemHL7QVB7qBC6gTtUeY+dU3fOm
         zhZz9u0A8H+6q5AhVYkMjeiq0TxAGXy7+dQ1kFGbZHCdjpeGmVWPOVsk314iziqZNvAq
         OPjh3D2voaTi/MKEde6O4XKbHI9dFP05j3krwZGbl0Z5XRG/nF6WIpkui9kKGrtP+bT8
         KI7r7iW8r+MsXye/MZ58mh+RrD+hjgrxz0QJ5heCWQFKXrXRB4pEr4by4QoMwA/XvrSH
         47Kw==
X-Forwarded-Encrypted: i=1; AKwUvByB1hCaz4jeEUFMNy7MwVM2zxl1Z8F2tSC2jsUKsMwd1GTE/BpglP5tlvYMGNEQN+iySXFiuOePfnfb3l0=@vger.kernel.org
X-Gm-Message-State: AFuF++nnMetzXMGff/MPgXoYnSYnPhvDGs8DbSqtJxi3W3HRdoE+U3v/
	Pw4mRNXUNXZFAb4lHsXyd/njqtk5KlBw4v5ExTfxXSWcX6092kmDD70v
X-Gm-Gg: AYBFou2g2UjiU0phAtKdmH2IoaltMMQEIlRdTYbxWFqJ795feQRQrPBiFPm1nFGRE7p
	ZCXjnkLzRvpcQlyryjOrwY3RiN0gHLhrWPEq5/FkDik5UPXybuZGyvY5ht2A619OvENLTrxWBlg
	Bm64xRhB+qjVtfBX3aCEW+6z0tLt5YBWBZukL3j7th+AU6cWCXK1eCtopNAmWyNolx5HCiYf+g1
	GMFg47eOShLxrbKDJFnt0py2jxgWeDXl5fmGAZeHux7ho4EDeyXe14Lgdqwse5JS2RkgNuXCUjH
	SNo8OXR7Mr+pAZ9BaYdP8BHlBFLLcyQTKwPzucJLZhkiBPhPamVBpI67Ilkt8WJu2PZjZ2+4mao
	ijO427Qc5tQ2liMRZxcRRFdezGIVPv1jK/KuY6YoujCnUm2dk4lyMIui5Ts6sSuNzBJjz+8/c9x
	gtq1T9IIPxxZT/Dc/NJRLzcBJuf3V2QMBxEfUS/xXgTTw1AaTlOE+O/xWtSYS4Ke5fSlg2Ba6RS
	B8ai+xYg0bBqw==
X-Received: by 2002:a05:6512:2511:b0:5b6:183b:d202 with SMTP id 2adb3069b0e04-5b8ae69ca27mr768798e87.41.1789395940103;
        Mon, 14 Sep 2026 07:25:40 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04798d2sm2492509e87.69.2026.09.14.07.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:25:39 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add MangoPi M28K
Date: Mon, 14 Sep 2026 17:25:32 +0300
Message-ID: <20260914142532.1997-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260801080018.3220034-3-amadeus@jmu.edu.cn>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn> <20260801080018.3220034-3-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 1 Aug 2026 16:00:18 +0800, Chukun Pan wrote:
> The MangoPi M28K is a development board with the
> Rockchip RK3528 SoC. It has the following features:

Tested on a MangoPi M28K v1.1 (non-Pro, 4 GB, no eMMC module) booting
from microSD, with this patch applied to OpenWrt's 6.18.44 kernel and
U-Boot 2026.07 built with a board target for the M28K.

Both GbE ports work (RTL8211F on gmac1, RTL8111H on PCIe), as do the
LAN and WAN LEDs and both USB 2.0 ports. With the same devicetree on a
6.12 kernel, the AIC8800D80 on sdio0 also comes up with the out-of-tree
driver.

Tested-by: Andrey Korshunov <razor1702@gmail.com>
