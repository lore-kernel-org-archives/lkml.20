Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884198;
	b=J86KXZj3NBtfx5GV2eW3c41BvdmpxQmkG2ftECq740Rq0TyrlWITOJpGYNxlapB1IYEh
	 MOnMCLMmpXYcpRPXU4BANQE4cwAr+Uumd7Bq9lVWSTlg2nye9LKey6fvLkektWsYEp38R
	 9rf7Cez4zyIkVSxhMz5neJaaiZuPaP03fGTnTg48bGcFz42AlLi69lh07tCkFhgMRrHA3
	 u4AB+vkJLQaERgwNJtyidGApRkhahUxvHRWApUWUknQ9cRkv+pX7lBdHI+2BB2DjhiyPC
	 YJe3gWKl/TECIam+fzusF6QaXz/bpfULQL4KpG+PQzedsomPSIeslElyNJBiU8msWVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884198;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=OJRWJeXrvQmODYAExg7m4mDpe5p58dqYM/Hnn4LmFfE=;
	b=zci3q73G1mDUQ1A3uh6Xuy8nK0IFx8Rv9igKmF9/5ZL2DZLGiaARnRnnZtRpn2fjEIC0
	 EKBtOgynhSJ45ADbuaCvEOgLzS3SGmeJPWywpq/4IVHM2yNQ2Cxqkl0TqvT3Sl+sQ5L/w
	 kynhF39gqnE74J0TTQHxYK63MvBWWmE4ovIjkF3QyS5lYj/LxNbiQUzHCLU2xQGv4HkcB
	 OBzKEGuN66jzHgT0SqxOayYTBiwxo5gXW0UFrBku+BjS4yR60Uj+qYBu9M+Vu+bxMcWx4
	 JqAWw4YBXTm3HKxAbYO5GZkfcQ5K/V4YOLAGBsdVA4fUSqpM/jvbcLUM1ejvIl8S3qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F8606A31C;
	Tue, 17 Nov 2026 02:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz7t1794884128td16f0902
X-QQ-Originating-IP: tKITFu9fk6+0Q5Dh8wVGUM32Tg2lPtWsb2gOC8zAMLo=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 10:55:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1497016459313032982
EX-QQ-RecipientCnt: 10
Date: Tue, 17 Nov 2026 10:55:26 +0800
From: Yibo Dong <dong100@mucse.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <72676011073A7040+20261117025526.GA214154@nic-Precision-5820-Tower>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
 <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
 <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
 <236B4E2337BC768E+20261117014902.GA205295@nic-Precision-5820-Tower>
 <2ddca58c-608f-4a0f-a26d-df92c2c34c69@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ddca58c-608f-4a0f-a26d-df92c2c34c69@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NF3tN0JyXxqWu7NjtIcYXK8bcIOdmVHhxYIC0zpg+h8MhENMz3GA6d/e
	ISSuw6hgkhILUTfdAeIosI6AOMwmwAjbLsyyJpaDJWt4LS5xhzg+aBUMSygj6ECVSVIoEtw
	Ni2zIpGBMHZtftRe2poBPivrArlvSZ/LirzXMNIiLdzf+KRF9gfp4zSoOly3p/4ZW3aAgk4
	j3U9UPketSdGy6FZbxj1oTtiSLEVci2sdgSsu66AsA47cfNzD5zNVnb55sT3yfKqo59KPPB
	gqALQgPANDTWMWwp4Lj3DztnGvpVq9Irw5I7rE+l2PliEzVZHNjUEJNjWZwQ5l32BKNyzj8
	JBUglHSODeUv7E1ygJDV4yXjL92xUMR2mRdnN8wOjTIg8zaarXw5nEXZqJukA9b3ulVtcLH
	52zP2YRFaL5xd59OBeTrt6Z+5MnumVgD4UO3w6SHALBgfIzjaKZLyajgtog7OWksc7oTXSx
	sDUA0DDV1LbpPeqkFsORAor1iMZuREGSelbw3iuPlMyXntlpMKMkHoyrIQDEW8rEY6ztMv+
	9ld6ghfIlPXwFGGTcDS8WtZeX8jM6xd55dKF+pJGMTzsshmF/igdZQ6lZPl+fVp6VIsF6c5
	ohsLfEcUPomfEZlfss3/pkdwZGh/87yAcpdI3AULlEq5dVGgvVq6bTHgw82MlwfoNpFT/pI
	mesG0NMkN7jhqmfxgn/5NqsWP7GrkDuuUQCwz9nUUHCKtktNAgdPToJRiCmtO5UoL0XKQ0w
	bSPS+XPOvyU097BqMMVvlW6Kqw/n9359PxwOj5ZFfGbinzakc3VHMTWul4e1RaNtBu44Tr9
	oNWKo8rPoN2DiW1TmKIJb/suwbS/Cm53BP7atjrJfkfl9cRLYIPegfaaYwSZuuIYSpSpOYQ
	/VvxIglYQlybbspkKVBrBvNFk8wgZaafOLMAp4yYaJZEL6xGIgSNFeL8Hlv+aSJYwEd1rCA
	s+Tkzcp/h+5AC2bAmK1KCCB40yIHapufqr/S9J/9D5wtBNMw/bNf5hiKZaVKZXAz+/gnybh
	/Kosc41Elp0ViYpW1iFa2dkEG44WuOX1XPjObQwNNyKKh7isATQ7Cn6QnpX+g=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On Tue, Nov 17, 2026 at 02:54:45AM +0100, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 09:49:02AM +0800, Yibo Dong wrote:
> > On Mon, Nov 16, 2026 at 02:18:28PM +0100, Andrew Lunn wrote:
> > > > link, speed, duplex and mdix are updated asynchronously by
> > > > the mailbox event handler, outside RTNL. link_lock protects these updates
> > > > and provides a consistent snapshot in the getter.
> > > 
> > > O.K, thanks for the explanation.
> > > 
> > > I removed too much context, so i cannot see here. What about
> > > lp_advertising? That also comes from the firmware, reported on link up
> > > when autoneg completes.
> > > 
> > The firmware manages autonegotiation and reports the negotiated speed
> > and duplex through mailbox link events. However, the current mailbox
> > interface does not expose the link partner's advertisement bitmap.
> > 
> > Therefore, lp_advertising is currently left zero to indicate that this
> > information is unknown to the driver.
> > 
> > If reporting lp_advertising is must, we would need to add a new
> > firmware mailbox command to retrieve the link partner's advertisement,
> > or add lp_advertising to link-event mbx alongwith link, speed and
> > duplex.
> 
> It is not a must, but it is useful.
> 
> Or you can just throw away your firmware, expose the MDIO bus, and let
> phylink drive the hardware. Less code, less bugs, more functionality
> for free.
The GMAC provides MDIO register access, so exposing an MDIO bus is
technically possible. However, the firmware currently manages the PHY,
and its interface does not provide a PHY ownership handover mechanism.
Introducing host-side PHY management would require coordinated firmware
and driver changes to avoid independently configuring the same PHY.

In addition, on this SoC, the firmware configures MDI/MDI-X through
AXI-mapped control registers driving the PHY's pi_force_mdix_en and
pi_force_mdix_mode inputs. This control path is outside the PHY's MDIO
register interface.

The firmware also supports link management before the host driver is
loaded and while the host is shut down, including wake-up handling.
On OCP platforms, it supports preserving the PHY link across driver
reloads and host shutdown. These capabilities are already implemented
in firmware, although driver support for them is not included in this
series. Any future ownership handover would need to preserve them.

Would it be acceptable for this series to retain the firmware-managed
PHY design without registering an MDIO bus, and leave lp_advertising
zero for now? If a mailbox command is added to expose the link partner's
advertisement, we can populate lp_advertising in a follow-up patch.
> 
> 	Andrew
>
Thanks for your feedback.
