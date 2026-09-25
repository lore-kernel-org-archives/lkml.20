Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420095013B6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377920; cv=none; b=MmZYM4f1rXRTR5jQ4yS/3DYIuBFSsnxZ3SCJfqwFyR4NvQNFSKYuNEumdSJVW5448ScVDEAObHeJUEaiHbHfJkhgn1quoJ0OEbkwKBEZEJvhdRnbCEXEpkwUTasG1SSGuiuBh3HMtvgm+5RDoDP6w1y+cD5nZrP5EFqi3JFLTnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377920; c=relaxed/simple;
	bh=HlSqHjuC92qxOUv16bU9Umy8f8TFh7MAVrq0Q/itHZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCoaXQfBIliGsCI824iMAGdJ4edFvP9o5Ei4zrXGWR85H+3MvvREXqu5W+sebfUwfjSD+kyxox4HHub/FP670rMN6ZfmzvTwa6nt5E+hjYSNKfj9T43xTX42X4wFFDw3esSe1NDDs1rUORdi5ai+S8DpPyJg6V3tfNOfTaV/xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qni5EYZo; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qni5EYZo"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e7106948so1146277e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790377917; x=1790982717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlSqHjuC92qxOUv16bU9Umy8f8TFh7MAVrq0Q/itHZs=;
        b=qni5EYZoVYQJSJQuMaU7kEc5cG6Unq9tFxB6lgEmnP6SLgzGNlz3rJAj1ytBa3kYB8
         tYdG5kJMIT++zv06tiywpjghgkVICylb0RjAorxn+6Xgq7rV3BXg2phErkka/lj/ZYmS
         y3cQ6toU9nK8KOgievflFRx2bFx/r458yk/+Lj8yybR2kbtq7q7M0cuE4fvNqw60CVQB
         m4pFtPefHGrC/JiskVGostkHUnkAw8sJrLMDA6iLeVjpkyvkLuIyPq7l6jJoEz03RSsX
         itnk2quMW2H2bEkAP4Ont+3JJiV5luIUlo6j3uEfBuC53Mkp/WbzL6PxgrZnMsUBC23V
         qizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790377917; x=1790982717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlSqHjuC92qxOUv16bU9Umy8f8TFh7MAVrq0Q/itHZs=;
        b=zyxTA+tCAZaMYA0jAhkuwJeZwTaRA2FAiehMHEkNZKCrmYusXmV4kBKEkeK25M1Mjs
         V3/6I81bYRRrfAwEQqXuTuCzfplDjxGoefG89CQLYPjKRYa4p8Zm4noq3lRRqq9g+l3e
         C5GJ/Y7gPpeE9wczfKbDRQhe1+MD6lTYk1f9NMbxNFzR0P7fEerBC0XSEctLL8+1X/eJ
         nSFVlvGlXul7a55Wx+r2Reha/4DJMHAepKejfXtakY1nS03I34VgYLiiIFxy7ujC4KCP
         w80jsqvswLU8H6L3Qkv1EeoMGcigRs/TjCctzkBwwmJC5j23mR7l84DLBUIrdTndTffj
         mn4g==
X-Forwarded-Encrypted: i=1; AKwUvByvpVqF7lvEzQXKMiTjo32R7D6Fs6v24PQsFhxy6iEmcWzf17+WWAitzezcMqJMm3cl+8jxNLgwbyo7MtM=@vger.kernel.org
X-Gm-Message-State: AFuF++neoM9f5XUEjzqSj5MtbKZZe0uNs1CB1Ubc24otbzmDwKpUeX7F
	hNXbXYf3iGlCCW/ZcCLG6/Sw3GH3QnpbvYiVXYtZwkSbSQNyf4Gn3+UV
X-Gm-Gg: AYBFou2RwfXIE1oFItBmOlrHNtLA7EcnUnmCi2ZFRGb071pmf4ykUsdvpLz37DsgnK+
	oC0MvK1gh/g9iwn5aQU8wC0pcuLTFt4IiRFXVZEhWxPLn1wQFwAM131GcDIob5igq8R2j0DzpF1
	QWWMkGL+16Yzez7QfeY7fqY/SMsSuT/jzK1Z0prp9dtAjvu9v19mv3QpZHC0HzQM+elu/BnwmdW
	v9xwcQpPQ7y1ch1V6Qr3NpnK+keaW7hS9N9WzingioaohpDOuPB+YLkTIG2oaW7PAwZfpufjx7P
	wubFSvKQTAwomkKbTSe9cf/Dqj9XwjdcxAiYQFJtfKwFrBMLZmzbJXbM6UmyPFgfqmyZ+sdC/Ju
	XTQzBvNQt1DF4Pgm9JCf6ajA1uOaeIfXTwRrmAfhrHe/L3laAXZes8ROGFPCAQmY6DK2EKWCFth
	20ENqNnMzOyFZcpE3PkmOygRus5bQk6zcntPdR+nKQzdmSpLEBwokG+8xQdcrSzqYWYNEdrNeyu
	5tG1wzw7BOant4atuAa9FaBHMa72BR6DaGHKhFSrg==
X-Received: by 2002:a05:6512:2243:b0:5b7:6686:45a9 with SMTP id 2adb3069b0e04-5b8e6dcb888mr1135532e87.37.1790377916945;
        Fri, 25 Sep 2026 16:11:56 -0700 (PDT)
Received: from dau-home-pc.. ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b01cafsm866819e87.55.2026.09.25.16.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:11:56 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 00/10] tunnels: add core and gre drop reasons
Date: Sat, 26 Sep 2026 02:11:49 +0300
Message-ID: <20260925231151.542109-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923141923.GA2841095@shredder>
References: <20260922221507.3268127-1-littlesmilingcloud@gmail.com> <20260923141923.GA2841095@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 05:19:23PM +0300, Ido Schimmel wrote:
> On Wed, Sep 23, 2026 at 01:14:57AM +0300, Anton Danilov wrote:
> > This series covers the generic paths shared by ipip, sit, gre and their
> > IPv6 counterparts, plus the GRE specific code, in both directions.
> > A later series will do the same for geneve, bareudp, fou and the
> > remaining IP in IP drivers.
>
> Please only annotate drivers that you are familiar with, using and can
> test. Otherwise it's a burden on the reviewer and potentially useless
> code churn that will make it harder to backport future fixes.

Understood. I will drop that sentence from the cover letter.

> GRE_CSUM looks fine as I'm not aware of other tunnels that have a
> dedicated checksum, but GRE_INVALID_HDR and GRE_TUNNEL_NOT_FOUND should
> be renamed to something more generic (e.g., TUNNEL_INVALID_HDR and
> TUNNEL_NOT_FOUND) so that they could be reused across drivers and
> replace the existing VXLAN ones. Note that you don't need the drop
> reason to encode the tunnel name in order to know which tunnel driver
> dropped the packet.

OK. In v5 a new patch will rename VXLAN_INVALID_HDR and
VXLAN_VNI_NOT_FOUND to TUNNEL_INVALID_HDR and TUNNEL_NOT_FOUND, the way
VXLAN_NO_REMOTE became NO_TX_TARGET, and the GRE patches will use the
new names. To keep the naming consistent, I will also rename the TNL_*
reasons this series adds to TUNNEL_*.

> > Patch 4 adds __iptunnel_pull_header_reason(), because
> > __iptunnel_pull_header() reports a packet too short to pull as -ENOMEM,
> > the same as an allocation failure, and ip6_gre calls it for every GRE
> > packet, before the tunnel lookup.
>
> The series is inconsistent about this and returns different reasons
> (HDR_TRUNC / PKT_TOO_SMALL) for the same condition. I suggest that you
> convert pskb_may_pull() to pskb_may_pull_reason() and return its reason
> instead of HDR_TRUNC.

Will do. The WCCP check in gre_parse_header() uses skb_header_pointer(),
which only fails on a short packet, so it will return PKT_TOO_SMALL.

Thanks for the review!

