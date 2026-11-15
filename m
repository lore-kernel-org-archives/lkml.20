Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730785;
	b=TCAeYFlAbzo44BVn1wKZKnvyRC1/K8wmbNs6uROMybmkcs9UM4/EXV0QFroPoYgw255/
	 ww5ZchPNbr3QJR1P10BOC8/TLPPqUbZr3uMl4jxuYJfnnubuFalfTUMLMNd6HnqWsscB1
	 FlR2XUKC9bWUEjIlqB8JmHtu8Zh2kYjXJyDc7967nuJmClpyI3i+3S5LQ5WVa4ZkmXEbC
	 z4gZ2j7svrFJQxQA3u3b1/qI7Kl/TLv0zT4Dld3OiPHoiYE624/i+/icv/WKIafhCQXXm
	 dGFETtxeuidzz7BshL12KlJP4zb2e40jo7GttqrOJl9F4sc/tvvwcnaZK/vFn5IvUPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730785;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=80w8iL2W9gryhtVUMyqRJV/LWO4hHCXkBwuL/bmEPOU=;
	b=5hodXCKunjZCoRGjgyjyBA4THdrxuSX8FXXYwcgy3PxSSTNq0tmgW7g8SGUXc61rFvE1
	 yvo8xbFlVTgkx4KwHq2huwERQcxkRrMllzBfoeWgCYDkImDFio+hNZ0FxW5dkUrtiO4lN
	 sDd9WbPvSa5LAwYBKT2PZKvWh7+texYRh5i8AK1qotHd3ErD3JBPEEB25zC1qKDR0Vm7Q
	 637VnNt5PdhsYXSagwh8Ii9SS3LgpKBUi4xhULIjA5rtqBUWJIbJbldh/aRBPtCIMmjyf
	 SU92OccrzRhH2usrWah9smseU2SwddwoU6Fjk0SKTmOZIJfJIiopvATQFX8WvQKx0tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ey+epUG5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E104606A32E;
	Sun, 15 Nov 2026 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ey+epUG5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BFD1F000C4;
	Sun, 15 Nov 2026 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730785;
	bh=80w8iL2W9gryhtVUMyqRJV/LWO4hHCXkBwuL/bmEPOU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ey+epUG5GVqMxwfyLdvkzjamSP7BZiuKBDukA1SSruUwSeXRwO8C6wPjQBvaa4FOM
	 ax29sd05p7SaRBJoodPJ0a24rG0oU3gNI5yAgwZ8NMNJ0vxmMosU2gfc5EhE9VI1+W
	 8FJl5M5IsYrKldlO91t+nOIatQTFob6Y7lo11fRb38rnm6ATLd/rgumKBOJF/UW0ji
	 HoVFLdTv6Oxh7QiKwcT6siPTG6DBZH2qM3HxKP2DzHHDZ/OhWkovCDYkdCAoRDcL/G
	 VcfiWHA8nvebsSyNee7yoHIPPmun4PWIhQ+KowQJ9SNI8EFgz4gZxrsqGHHpkIMxHF
	 As9urmXH19lvg==
Subject: Re: [PATCH net-next v2] net: phy: aquantia: Poll global status
 register for provision ID
From: netdev-bot+sashiko@kernel.org
To: hongmei.xu@oss.qualcomm.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 sagar.cheluvegowda@oss.qualcomm.com
Date: Sun, 15 Nov 2026 08:19:44 +0000
Message-ID: <179473078423.2199510.11398825136938509686@kernel.org>
In-Reply-To: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
References: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In aqr_wait_reset_complete()
  (drivers/net/phy/aquantia/aquantia_main.c:708-721), the new second…
- [Medium] net: phy: aquantia: propagate MDIO read error in
  aqr_wait_reset_complete()
- [Low] The comment above aqr_wait_reset_complete()
  (aquantia_main.c:684-690) was not updated.
- [Low] On a provisioning-ID timeout, aqr_wait_reset_complete()
  (aquantia_main.c:717-719) prints 'Firmware provisioning ID not ready;…
- [Low] net: phy: aquantia: missing Fixes trailer for
  aqr_wait_reset_complete() fix

--

net: phy: aquantia: Poll global status register for provision ID

This commit adds a second poll to aqr_wait_reset_complete(). Once the
firmware ID shows up, the poll waits for the provisioning ID field in
VEND1_GLOBAL_RSVD_STAT1 to become non-zero. If the poll times out, it
logs a warning and the function still returns 0. The stated reasons
are link failures seen on AQR113 and correct fingerprinting of AQR412C
MUSX firmware.

> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
> index e95d391a6dc23..bed891cfaaa1b 100644
> --- a/drivers/net/phy/aquantia/aquantia_main.c
> +++ b/drivers/net/phy/aquantia/aquantia_main.c
> @@ -702,7 +702,23 @@ int aqr_wait_reset_complete(struct phy_device *phydev)
>  		return val;
>  	}
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	ret = read_poll_timeout(phy_read_mmd, val,
> +				val < 0 ||
> +				FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID, val),
> +				AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT_TIMEOUT_US,
> +				false, phydev, MDIO_MMD_VEND1,
> +				VEND1_GLOBAL_RSVD_STAT1);

[Severity: Low]
The commit message describes two problems: link failures seen during
AQR113 bring-up, and an AQR412C MUSX fingerprint that can't be built
correctly. Both come from aqr_wait_reset_complete() treating a
non-zero VEND1_GLOBAL_FW_ID as the end of chip initialization, before
the provisioning ID in VEND1_GLOBAL_RSVD_STAT1 is set.

If this is meant as a bug fix, should it carry a Fixes tag? The
FW_ID-only poll appears to go back to commit 43429a0353af ("net: phy:
aquantia: report PHY details like firmware version"). That commit
added aqr107_wait_reset_complete(), which was later renamed to
aqr_wait_reset_complete().

Without the tag, stable maintainers and backporters have no easy way
to tell that this change addresses a problem in released kernels. And
if it is a fix, should it go to net rather than net-next?

[Severity: Medium]
This poll only exits on a non-zero PROV_ID or a read error. If a
firmware image reports PROV_ID == 0, will every call sleep the full
AQR_FW_WAIT_TIMEOUT_US (2 s) and then return 0 anyway?

The commit message says "not all PHYs require a valid provision ID",
which suggests PROV_ID can stay 0 on some images.

In the driver, prov_id only matters for one fingerprint:

  AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX_ID40019_VER1198
      AQR_FW_FINGERPRINT(4, 3, 0xc, 1, 40019, 1198)

That fingerprint is only checked for PHY_ID_AQR412C, in
aqr_translate_interface().

aqr_wait_reset_complete() has two callers, and both now pay for this
wait:

  aqr107_probe()
    aqr_firmware_load()
      aqr_wait_reset_complete()

  phy_attach_direct() / mdio_bus_phy_resume()
    phy_init_hw()
      aqr_gen1_config_init()
        aqr_wait_reset_complete()

With such an image, would each port lose about 4 s across probe and
attach, and then 2 s plus a warning on every later attach and resume?
On quad-port parts like AQR412/AQR412C, that cost applies to each port.

Before this patch, both paths returned as soon as FW_ID was non-zero.
Could the PROV_ID wait be limited to the PHYs or firmware images that
need it?

> +	if (val < 0)
> +		phydev_warn(phydev, "Failed to read VEND1_GLOBAL_RSVD_STAT1: %pe\n",
> +			    ERR_PTR(val));
> +	else if (ret)
> +		phydev_warn(phydev, "Firmware provisioning ID not ready; "
> +			    "interface mode detection may be incorrect\n");

[Severity: Medium]
If phy_read_mmd() fails while polling VEND1_GLOBAL_RSVD_STAT1, the
val < 0 term ends read_poll_timeout() right away with ret == 0. The
code then logs a warning and returns 0, so the MDIO error is lost.

The VEND1_GLOBAL_FW_ID poll just above handles the same case with
phydev_err() and returns val. Is it intended that a read error here
is non-fatal? The commit message only says that the timeout case
should not fail probe.

Both callers act on the return value:

  aqr107_probe()
    aqr_firmware_load()
      aqr_wait_reset_complete()

aqr_firmware_load() treats 0 as "Some firmware is loaded => do
nothing". Any other negative value goes to the default branch, which
passes the PHY read error back to aqr107_probe(). With this change, an
MDIO failure on RSVD_STAT1 looks like ready firmware, and probe goes
on.

  phy_init_hw()
    aqr_gen1_config_init()
      aqr_wait_reset_complete()

aqr_gen1_config_init() only builds the fingerprint when the return
value is 0. After a read error it now goes on to
aqr_build_fingerprint() and the rest of the PHY configuration, even
though the provisioning ID was never seen.

Could the val < 0 case return val, the same way the FW_ID poll does,
and leave only the timeout as a warning?

[Severity: Low]
This warning can fire on every model that uses aqr107_probe() and
aqr_gen1_config_init(), such as AQR105, AQR107, AQCS109, AQR111,
AQR112, AQR113, AQR114C, AQR115 and AQR813. Is "interface mode
detection may be incorrect" accurate for those?

The provisioning ID only affects the interface mode in
aqr_translate_interface():

	if (phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR412C, phydev->drv->phy_id_mask) &&
	    priv->fingerprint == AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX_ID40019_VER1198 &&
	    interface == PHY_INTERFACE_MODE_USXGMII)
		return PHY_INTERFACE_MODE_10G_QXGMII;

So on other models, a missing provisioning ID can't cause wrong
interface detection.

The message also doesn't mention the link failures that the commit
message describes for AQR113.

> +
> +	return 0;
>  }

[Severity: Low]
This isn't a bug, but the comment above aqr_wait_reset_complete() was
not updated:

/* If we configure settings whilst firmware is still initializing the chip,
 * then these settings may be overwritten. Therefore make sure chip
 * initialization has completed. Use presence of the firmware ID as
 * indicator for initialization having completed.
 * The chip also provides a "reset completed" bit, but it's cleared after
 * read. Therefore function would time out if called again.
 */

It still names FW_ID as the only sign that initialization is complete.
It doesn't mention the second, non-fatal wait on the provisioning ID.

Also, on PHYs where PROV_ID stays 0, every call from
aqr_firmware_load() and aqr_gen1_config_init() now times out again.
Isn't that the repeated-call timeout this comment says the design
avoids?

Could the comment be updated to match the new behavior?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9%40oss.qualcomm.com
