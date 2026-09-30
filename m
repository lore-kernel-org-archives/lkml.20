Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3D4C2265
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803419; cv=none; b=R6RiM6C3r+kdeOElb8QPP48k326+5KoaARseFIR773mY/tg9Aq1QFpxUkZH/hpKY/prp1WlQw8wHN4aSWhJdbzmhIZo5vpYMZabifFRZpMRwGheP/T7CobdJ/BWvpbET4U7cYZeSXqeExwm5KY9VcYTMVXb9Zxw9PzTZ3K6v+H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803419; c=relaxed/simple;
	bh=xtBz/Ol8neW9iAfoL13hL7AWm7dg7xItra2S/I0XCDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/6kY4dVd4FW9XklsNeQ0OTjMu3GgxgabUlfQ7TnXlvN2hYC2zNMuzOQDJc7evDFoLPfiv70y1F41GHfUrvYOj5EurfqRJXY2vOV451x9J5m2gfeTEc4HDcdCUmPpPd5kHLU9hlxfyILPNpgrQ3hE6kzJrY5EaujPa5OYXVMTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2Cx68uL; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2Cx68uL"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e23be09baso136395966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803416; x=1791408216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBz/Ol8neW9iAfoL13hL7AWm7dg7xItra2S/I0XCDk=;
        b=L2Cx68uL7UZjpsUxe4pmLTVlWgCEEVabOdhD6GCd4YxrXi6PNyB65U8Hk5nausP7uL
         NkfKh8SIR8F8RgCjokO5ajZ/bb8qpeWA1+tFp7Z3+6BK4V/MG9zJS+llOXmnqzzTpBM/
         Tab059avhXdAlIAfujKQCW+m9bXHXFYsZSSvGVJ8HF1VE6n8Th9IP2VN4XCJXsdvMblL
         ygSwwnDWh21WFNlAbXy7oQFGC6SML0JDzFvDXDVdUsc5KuRBFS2hP2OUEwna1XXwpnzp
         y+d8JYjs+o28/lvsVn7aLweW4ohWMpHy1b0HHsg4Lbk1bgEsHzO6Asdri1gUa6/9jQuG
         dYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803416; x=1791408216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBz/Ol8neW9iAfoL13hL7AWm7dg7xItra2S/I0XCDk=;
        b=NHT5VvStrhegk4ee3yUCu9AW/u4CphaJqOgV4YqFKgybPMOt0AIpVWBxAJpaLcA74G
         xBOOJKxN+pjpRFxCKoOFTEuueEfOjGL8eIy8HIhNuiGkTP+4qrhOb1Unribr4EXbSyo2
         7p1MHa+fR6WXGoMkopiIDgYinPRKGXLdIKHcVPbVXArh9CoDZOZOh8Dg0VXdhrgwG+35
         SO2X4e9Svz9TfFMwGmJO2HjLRLKMqZ/TrGe7Ea8ng6lBoY/yUv5fO8MUbUHxrxFDrPBh
         u6Yz9M+lUI9v6HMnx7NqIwK1Ws6B+7EmTKorfXfTJg4hoMfVRd/ZoNsDKmxSBJ+bPf6f
         JOFA==
X-Forwarded-Encrypted: i=1; AKwUvBzb29id4Nm1sd0vajfIRHN6/GDhnQLxLM1P9Vpc4sMOMAVbC2X+jTLxsnzJetmdHJ+5gPV8q5p2tx1rDhU=@vger.kernel.org
X-Gm-Message-State: AFuF++kq+d57xGNzh1pwKbh5PJ5aQ3hZ94r1gX4Dh6AAjLdPVJ8IeNrX
	EhNHLQrya4znkkRspTKBaIqV00IbHCDyE8O57Q8WpvWL1IbrSz3d4YFm
X-Gm-Gg: AYBFou3GJfSx+5rmDLGFAWB2SC0Dn04cstgWJnv2t2yp3yiJ87NSf9R9QrAmwwIlgYe
	sjObj6B65fv9bwH/ZPf6ZXRpjeg5tdCZKhFgKWysJ5DC3b0XMKrRQ0jtf1UIO6vtJB9G5v6m+7E
	/V+J+SCzxxkDzf7My/nk2ymkDlujt/i3jgp2vOD8TfVGGL/M5BmaXvwWNhqj07LN1F9JdgeUob1
	n+lrmBg/TmlDli59nj2IQHoiFW3e+FxxMWKotdSXMyuubRW8cHuPZWxC0MO8mIh9rq6rz5INX9y
	7AdPWneuQIzUhN0opO95nTwO36RNB7KLG35QKZ/lhfuIRpMvBoCjFWDy64M6UI8c3Vf8YNl7q51
	n58dg0ZwuYWl5MDHQmi60wQxRqxdE2tXo7ilpsSJ51k2B0GZ+QI1Keq4wnXTaogmQQkH8hrXMeY
	BfiQh83PMOymXYNW8aaqRQCyiqlxCwE7DOGigCNmmGH9MCHR+E4Pz+dwj2g7tPPjeKQ+yFYPD7D
	gNLutGHTFouwFfhVZJkYeEp/thQRjmIxD7K8zONI+nBIDWsy3N4bI4Hk24ud6EsFNdYWF40zapy
	t3zBgHzeZDdHPgI1p4GQOFQJkIJdyTw=
X-Received: by 2002:a17:907:6ea9:b0:c29:3aef:f2e2 with SMTP id a640c23a62f3a-c2e23dbee0emr209042866b.40.1790803415701;
        Wed, 30 Sep 2026 14:23:35 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-82.cust.bredband2.com. [83.233.221.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d3939dsm58665066b.43.2026.09.30.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:23:35 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Crispin <john@phrozen.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net: dsa: qca8k: propagate MDIO errors
Date: Wed, 30 Sep 2026 23:23:23 +0200
Message-ID: <20260930212323.1031-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <12875133-1659-4507-a007-c3cfa425ec76@lunn.ch>
References: <20260928220629.238-1-yongzhao.derek@gmail.com> <20260928220629.238-2-yongzhao.derek@gmail.com> <12875133-1659-4507-a007-c3cfa425ec76@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,=0D
=0D
> Does this actually bother anybody? Have there been reports of actual=0D
> MDIO errors?=0D
=0D
I am not aware of any reports of real MDIO failures. The evidence comes=0D
from code inspection and fault injection in a model test. In the next=0D
revision I have dropped the Fixes tags, and I will post the three=0D
patches for net-next.=0D
=0D
I have also fixed the reverse Christmas tree ordering you pointed out in=0D
your other message, and checked the rest of the series for the same=0D
issue.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
