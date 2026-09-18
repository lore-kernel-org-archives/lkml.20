Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1E4D17AA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725973; cv=none; b=aFSe9gYcmAujz9Vg09JOod4qEaGmafwmlrPY7mFzJc+B5GnM7uKqtAwExe/EgT0F6Vk6bfcaDS4zElpvbnQL24vM/x2zgvPuG5hVByejqvj5YkQyjXn1Tw6yAcOVA9RNlqnf2FnjGzqVHGauM5BCGEMCp/mlO+OTaNTL9tVjwwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725973; c=relaxed/simple;
	bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtbM4u/VOPyKtOmi0rSB3oJo0D5zIHxixXCJX1l09N1s0LKTeu10TDLiA4by7QFJL1dNCm16/O5GbdMnhgTU53t8vVgKWFQh6vvPoNCxI+uOEuwEVDeJihlCgZTt2f9Fa3eqbM/EPpfZNswf+tbdhScFyEZkZnm2ycpLn5Ph+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwmaNpy7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwmaNpy7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso64472f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789725967; x=1790330767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
        b=gwmaNpy78/xbD0P9d/Skf3yiI+OvGv6GC6WWwpq+ZwSjMS4RUeU+63H0ka7NhZz+Zk
         0JbBizwObmhNrRl7M8sI+c+/8iMvB+m+t7WcKy9hVwEh7nR+d5UMgMjeKCPCbnDl5Fmb
         gpo2teQazeTJ81DxIIuSVp0Cx7/YJ1kgAj29o0hQ6cERIcooX3zGpWMxk/3a8gG/Y5Jc
         UxrSaoT0OT/B6CQ0wwAppqt9CqCzRjwjlVtXQoYKdMUWcgacWwIWTXLa3xvs6TTsSSBX
         vZhoqbAvg2dD8Udy10ddfC1iZOKMxq2c/aAJ8mx9uX/MFdxonK4nV2jjC9EPKQeU/tC9
         3qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725967; x=1790330767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cDRNp7sN30u47HZEONtfi3hMQ/gOuKGJhHadwqE0Vk=;
        b=vW2OraO25GSvbqIinX5usNXzJmXNlVi9nCTULbOT10P/0y0XaZma7wQyuwhWJm64C9
         379wwFjq3XyiVHVzNZ8QERTgFmlBcM/rmLYGb7LLfEASf3wYTT2fiUpTisBSP+9Gmp3K
         dGp4LB21ox+Pz9SXOrMLj3CKnIB3PXFq796iIEQDYiPk0GnJ2ZH68TOOsILBKee6oXBx
         C8uZl4Ix7gsOvGtJm1zo5/xLfSboFTaSeFjR9kmsDO7BqQqSmLLJDNKddevKpq8SxoWS
         dFMUYIQqBDFpX3kGabKsk2hzj+kUKlmt4ZSPg3qAW63RRZPt0xSVhFmFNmFDrhRj0oMY
         WMTw==
X-Forwarded-Encrypted: i=1; AKwUvBwEhtH6eX66aijo1ii3ybml/cZi4TjWq/kdqgU/MJWJ/gDxtM3dkoRAIuva8qkltkDMa0mzyPXb24fjfXE=@vger.kernel.org
X-Gm-Message-State: AFuF++kfJaCYqPN0ZVH/pYe0bbt9P2rt8NGDMnyP894Xr7zcBQ773h1F
	QyHy5bZ6vPzDhw9rrbTpTx+rzCSB7dpz7c/GN4NufyRN1LQZbhFP+xg/
X-Gm-Gg: AYBFou05hox9sZM96gY3BfR+yljK01vqg60nVGRdmBnFUpAzwcgmoKAO0CvJS6ttB88
	DftBAOJFqx7iTxONiPELukJW9wDJK7n2gC6gOu7fw3mlY6czOCI0qpDM8ownsJ2/1Ki29m6dkBg
	6rCg0cWoy696hTriUrPZGBrpChDCEv6HImAtDFl8nr5jSMPYXxSI2wsUTG4PtOQ/PmmH5Kn1WtP
	5+c1C/USCKQU+jkjrok8gzYDV40R4g22/0epwfJvmOQZWuDMiLrzLFKO1vMc/VHXTd3gh54LUNh
	SvGIrkSeCYB+wZqCdVKBH1qjOEy9Ic+EZmTMRxoXgpxXnunlXGnuCpv0dJ6iaYqr5g4jx3FfcDR
	q24QLKR5qAXEXt9BNwlmDOd+PM3UrZZPubJCa8ihvA7TE8r4Cbvfd9NBAEFUfbatwp+nEepeSeG
	r/+IQ6AoM/OvjTx4GcayoYvWGqMP7XygZITt1dp4XIfeoz1IC0GuWbg/14aWKnyeqLuuW3cBQXy
	D2Ja1JAg24TdEiaqwCqizhM/oq9MXtJFlnkwqbdZDLRMmScKaAxwp4koFvCsYms917h84vn+YRB
	uSCSTjM6J3GG87s=
X-Received: by 2002:a05:600c:83cd:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49fc7ddb90emr15837745e9.2.1789725967027;
        Fri, 18 Sep 2026 03:06:07 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm2922671f8f.9.2026.09.18.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:06:06 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] accel/rocket: DVFS for the RK3588 NPU
Date: Fri, 18 Sep 2026 12:05:43 +0200
Message-ID: <20260918100543.23974-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tomeu,

A gentle ping on this series, two weeks on.

Conor acked 2/7, and Nicolas's review of 3/7 means a v2 is due.
Sashiko could not apply the series, for the reason you gave Jiaxing
on 31 August: its prerequisite, the slot-search fix (link below),
is not part of it. With that fix first, the series still applies to
today's drm-misc-next without conflicts (git am only, no build).

I can send v2 with the fix bundled in, so Sashiko can review it,
or wait for your comments first, whichever you prefer.

An LLM helped me draft this mail.

Thanks,
Igor

https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
