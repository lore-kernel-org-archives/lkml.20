Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904456;
	b=Kmx+lNk57yvPIqDRBxabYKXGAl4E9F23IXexAySpdCF8+fps5bNSZS1/5X05US17VbbP
	 Df0V4BsDRJMIBXY0zW9cPofEQ7R3ABYfwAdYDb+0In0RvnA6CID7XKCerUvcO8t3TTvxQ
	 ea0r8bgsTAczFDGC3XWuNUzs1Qa9KXQTwr201WRrBpjeTRf6zHbmQHs+/rcRT9kHnL3bC
	 3hdqBLEYrsHlcGZXjTprgsFBIs+Ry9WOZN8S4JBukI0uG6+Imv8z+/sN4Wml6f5k068AS
	 pPmkmvAOYIGDhBt1NnLUQv7VlbcWlw0q0yXQR84+AT2bwf4gG0GoTUBVGCVzqVp5iOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904456;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xlo8wcQjaDqpJN+i27lOG2BNVNx2einhHXlhhNfvDxo=;
	b=mK5+2S9Gk7KHtdUNT3pZd+nHjJP2lJ+6DxoGMEKrtk4JSCx3117Dbi3JPtTHpTA+kuis
	 glWbbrHFJDGUNzvMuoRUGZHTxZ8HfioZyzfnrBeF+wDBX5dpXobGuLlDgR3MEiNtOqzbs
	 uxPVXeBKQyVuUDWsc72aiPb1r9sPC32/7Zdrn0Uj1sFd8uCRui3Zc3xE+nYQvO6/vCr86
	 ln+yqFI6SCFduCER3xTt+q9LXj3bq/kf6tcmP3ZdAQC+VLYaSAFsIoTpsF9EWSHY1IkCp
	 n2Cx3pqAilA+WRu4yZkux3QP1ZIeY3J2nCjKQrXvQCe628PFYLCSGyqJN80lB4iNA6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JwoGzyXw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DB60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JwoGzyXw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FAB1F00925
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904456;
	bh=Xlo8wcQjaDqpJN+i27lOG2BNVNx2einhHXlhhNfvDxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JwoGzyXw3I6fmJU74safXu0edhbR2qlcATY8pxLsmIkQZ/CvsMKAcCFocrv+mU+N3
	 l9lFMIxvMggBzC3M6YDhmh9pQ/S0wR/8xeKy5tCmOcQx/oTXtkYT8rg8hBkoUt8Pn7
	 GU43FVhr2qxfb7YUoIuFs6LdmfjMsFe3cdwTRgG8if1LuzJ7ml8QMT67Mu1qUN0q7I
	 anUSZ27lS25UZqVD09/Qt+M4fuNPZ24aS/QAsBSQg9vfddQW9ZhEhoRatcWsV65Ptd
	 YqqgTWnAFEguHl4THEDM5qgUiHq6V1Gv7fFr1qVGFsOkOXgNxTX/a8DED0QGuWRuWW
	 dqaSOQue5qO6w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1479be604so397558e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHOIq03cfMTR+Q7t+HWGeTPYl0NkFrH1Y1NNE7bdReZYpIOseUIdJs9lIsI6BpGC5lr8AoT8jGZw1BH/30=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eARdzD4hG1i5Xa0b1573mEYy2HnzS8CuyDGkfr8R0ZJxfu1KR
	jDRDoLboJlElQXIY4aTMTBStz5F0chU5sCsVhs/s4FMcy6PbJ8s1I0utOvtMAWGYxUY3Zx66S3D
	RHTELXty1w/AumcqPaHZO6TX1DyrPrRc=
X-Received: by 2002:a05:6512:3c8c:b0:5bf:d60a:5c60 with SMTP id
 2adb3069b0e04-5c1709cf5f6mr5064151e87.55.1794904454868; Tue, 17 Nov 2026
 00:34:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com> <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
In-Reply-To: <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:34:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJxM2yE2QwsDijqnsP+bH=xNfcNy+yj3hbv1k+q9aJ=g@mail.gmail.com>
X-Gm-Features: Aa3M54pyqseL91ex5uV7ApTMHAGocbXWZwvG-XI7XkXAJVMEsnCU-17E2PSG6tw
Message-ID: <CAD++jLkJxM2yE2QwsDijqnsP+bH=xNfcNy+yj3hbv1k+q9aJ=g@mail.gmail.com>
Subject: Re: [PATCH net-next v11 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:39=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> The PVID helpers (rtl8365mb_vlan_port_get_pvid(),
> rtl8365mb_vlan_pvid_port_set() and rtl8365mb_vlan_pvid_port_clear())
> work on a VLAN MC table index, which only family C has. Family D stores
> a raw VID in a per-port register, so it needs its own implementation.
>
> Move the helpers behind struct rtl8365mb_family_info, as already done
> for the VLAN 4k accessors: the existing code becomes the family C
> implementation (rtl8365mb_c_vlan_port_get_pvid() and the like), and
> the three functions above only call it through the vlan_port_get_pvid,
> vlan_pvid_port_set and vlan_pvid_port_clear pointers in the family
> info. The callers are not changed. The following patch adds the family D
> implementation without any is_d() check in the shared code.
>
> No functional change.
>
> The family C functions are not static because they are referenced from
> the family C info in rtl8365mb_main.c.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

What about:

int rtl8366_set_pvid() which is shared in realtek.h
and implemented in rtl8366-core.c.

It is currently only called from rtl8366_vlan_add() which
is only used by rtl8366rb.c.

realtek.h also have these as pointed out earlier to another
patch set:

struct realtek_ops {
(...)
        int     (*get_vlan_mc)(struct realtek_priv *priv, u32 index,
                               struct rtl8366_vlan_mc *vlanmc);
        int     (*set_vlan_mc)(struct realtek_priv *priv, u32 index,
                               const struct rtl8366_vlan_mc *vlanmc);
        int     (*get_vlan_4k)(struct realtek_priv *priv, u32 vid,
                               struct rtl8366_vlan_4k *vlan4k);
        int     (*set_vlan_4k)(struct realtek_priv *priv,
                               const struct rtl8366_vlan_4k *vlan4k);
        int     (*get_mc_index)(struct realtek_priv *priv, int port, int *v=
al);
        int     (*set_mc_index)(struct realtek_priv *priv, int port, int in=
dex);
        bool    (*is_vlan_valid)(struct realtek_priv *priv, unsigned int vl=
an);
        int     (*enable_vlan)(struct realtek_priv *priv, bool enable);
        int     (*enable_vlan4k)(struct realtek_priv *priv, bool enable);
(...)

I *think* we agreed to push all of this into the RTL8366RB driver because
the way the RTL8366RB and RTL8365MB were dealing with VLANs
were just too different to share the abstraction.

If you can confirm that this is the case also for PVID I can send
a patch to push this into the RTL8366RB driver.

Yours,
Linus Walleij
