Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837036;
	b=n0ESvM0eny5bFYEe6pfkJdyBov57MGvz8jVLQWIyDCVoIUfzCPwdrZ6JtyrhoxpuTVUT
	 UkTPrrlkRVOYp5AjoIqtw0vVR769DUQ3xG9w1zN0uX4F9A5GU3jZkHmZTano+cq3ZfJPU
	 4mL1VncS3palyPFcwGsWxNaCND6HHLm19f3uM7xr6LRt7RRVksqU4JqanW10wxEB0Bg6L
	 9h5mxfQiSkdS70HoXxocpRzLcGAbSbMWrOQXu+DurK5srtSIHL7M98CofADDq/iAkJ+VI
	 JnIzWSnIAOs4FVsGgwku8aCe7TdXLTWi3KkmPx88lkow+n4ZI8ihFn9PkZN27aUytqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837036;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a43gjyMYHFpUL2RrWYsw5g7IDtnj0wCK8HbG+t83W00=;
	b=gubuIfBi8Lr3735lRoikl9ygjXswBd8rqOg4U1nOuVQyIzZeQrEB/jS3Yu0g9hzvxPbr
	 w+7hLIhLgrPezJLT5Y1a+WjkYjjYZIReCg/oYG02+Z1rpSBNxv+hqO2b4Rkpmi7JvJ0U3
	 1F81K8zAdT/oby8Co2oPiFVA+aQ6RVgZzUas3FnWh7PwxaX9syM/7Y0SAs7Jfws8nw0kc
	 3jmeKMmv8uQMC7LDD0V8PfFlC+wNOq5sVLXIctGKsfLPztJltbo38rHl6vqhgosqpkp0U
	 YD5EilMQC7J4NtHu0kzChe5xCoCi6TrR3TtkEqFwQvfasMRv8ZgRxy5mM2ra+op1X/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=op1ZAhjt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38317606A890;
	Mon, 16 Nov 2026 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=op1ZAhjt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325B31F000C5;
	Mon, 16 Nov 2026 13:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837035;
	bh=a43gjyMYHFpUL2RrWYsw5g7IDtnj0wCK8HbG+t83W00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=op1ZAhjti+oPm3ImTI01s19svu0/P0BLYk+TygYMN7Ljge7SSsaRHht3k60r+woWI
	 j/WXttlrxBJ80ELdHacCkB9Xdg9TK7/uqx0CSrYZuTFwAV8lzM4JqBPJ1Qce9pb+0q
	 LVpTybN+SRhlpKkBGMP1oskZRXO5dGuxULapPtTAo2VVZeomw/g1w2q7G8f+QmHwwS
	 4b6Pk5b+ab6MsRhPvzREJxB5ndDaZvVLu4z/ByrRrgLgYGLXI/U3BlRSUBAbyV0XLP
	 TMBmXM0JqE4w1RuzX2+MBaHoS2ZtSPNFwww24JevLOKNVKvSmyq1kIiNVYugm6IDNL
	 y1nQ09eH6mg1Q==
Subject: Re: [PATCH net-next v3] net: phy: aquantia: Poll global status
 register for provision ID
From: netdev-bot+sashiko@kernel.org
To: hongmei.xu@oss.qualcomm.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 sagar.cheluvegowda@oss.qualcomm.com
Date: Mon, 16 Nov 2026 13:50:34 +0000
Message-ID: <179483703468.3136.10188755486781063737@kernel.org>
In-Reply-To: <20261112-aquantia-poll-global-status-register-v3-1-c805647a60b4@oss.qualcomm.com>
References: <20261112-aquantia-poll-global-status-register-v3-1-c805647a60b4@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In aqr_wait_reset_complete()
  (drivers/net/phy/aquantia/aquantia_main.c:708-718), the new poll uses…
- [Low] The commit message presents the change as a fix for user-visible
  problems: steady link failures on AQR113, and a possible wrong host…
- [Low] The comment above aqr_wait_reset_complete()
  (aquantia_main.c:684-690) still says 'Use presence of the firmware ID…
- [Low] aqr_wait_reset_complete() now handles MDIO read errors
  inconsistently.

--

net: phy: aquantia: Poll global status register for provision ID

This patch adds a second poll to aqr_wait_reset_complete(). Once the
firmware ID is present, it also waits for the provisioning ID field in
VEND1_GLOBAL_RSVD_STAT1 to become non-zero. On timeout or on a read error
it logs a warning and still returns 0.

> Starting subsequent firmware operations before the provision ID is
> valid leads to steady link failures; this has been observed during
> AQR113 PHY bring-up.

[Severity: Low]
The commit message describes failures that users can see: link failures
on AQR113, and a possible USXGMII vs 10G-QXGMII mismatch on AQR412C with
MUSX firmware. There is no Fixes: tag and no Cc: stable.

The fingerprint-based translation in aqr_translate_interface() was added
by commit a76f26f7a81e ("net: phy: aquantia: support phy-mode =
"10g-qxgmii" on NXP SPF-30841 (AQR412C)"). The FW_ID-only completion check
goes back to commit 43429a0353af ("net: phy: aquantia: report PHY details
like firmware version").

Should one of these be named in a Fixes: tag so the change can reach
stable trees? If this counts as new board bring-up support, the tag may
not be needed.

> diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
> index e95d391a6dc23..b90221f1cf41c 100644
> --- a/drivers/net/phy/aquantia/aquantia_main.c
> +++ b/drivers/net/phy/aquantia/aquantia_main.c
> @@ -702,7 +702,22 @@ int aqr_wait_reset_complete(struct phy_device *phydev)
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

[Severity: Medium]
What happens here on a PHY whose firmware image reports a provisioning ID
of 0?

VEND1_GLOBAL_RSVD_STAT1_PROV_ID holds the provisioning ID of the loaded
image. It is not a ready bit. The commit message also says "not all PHYs
require a valid provision ID". If 0 is a valid value, the exit condition
can never become true. read_poll_timeout() would then run for the full
AQR_FW_WAIT_TIMEOUT_US (2 s, about 100 MDIO reads) and print the warning
on every call.

The code alone doesn't show whether such images ship. The only in-tree
fingerprint uses prov_id 1, but the commit message suggests they exist.

The poll isn't limited to a particular model or firmware. It is reached
once at probe:

aqr107_probe()->aqr_firmware_load()->aqr_wait_reset_complete()

and on every phy_init_hw() (attach and resume):

phy_init_hw()->aqr_gen{1..4}_config_init()->aqr_gen1_config_init()
    ->aqr_wait_reset_complete()

That covers AQR105/107/AQCS109/AQR111/111B0/112/412/412C/113/113C/114C/
115/115C/AQR813. On multi-port packages each port waits separately.
Before this patch, the function returned on the first FW_ID read once the
firmware was running.

Only AQR412C uses the fingerprint, in aqr_translate_interface(). For the
other models, the "interface mode detection may be incorrect" warning
doesn't apply.

Could the wait be limited to the PHYs that need it, or use a different
completion indicator?

> +	if (val < 0)
> +		phydev_warn(phydev, "Failed to read VEND1_GLOBAL_RSVD_STAT1: %pe\n",
> +			    ERR_PTR(val));

[Severity: Low]
Is it intended that an MDIO read error on VEND1_GLOBAL_RSVD_STAT1 only
produces a warning?

On a read error, the FW_ID poll just above returns the negative errno:

	if (val < 0) {
		phydev_err(phydev, "Failed to read VEND1_GLOBAL_FW_ID: %pe\n",
			   ERR_PTR(val));
		return val;
	}

In the new poll, val < 0 makes the condition true, ret stays 0, and the
function falls through to return 0. In aqr_firmware_load(), the error then
lands in case 0 ("Some firmware is loaded => do nothing"). It never
reaches the default arm, which is commented "PHY read error, propagate it
to the caller".

The practical impact is small. FW_ID was already non-zero, and
aqr_build_fingerprint() reads RSVD_STAT1 again later and propagates a
persistent failure.

The commit message explains why a provisioning timeout is non-fatal.
Should a bus error be handled the same way as the FW_ID read error?

> +	else if (ret)
> +		phydev_warn(phydev, "Firmware provisioning ID not ready; interface mode detection may be incorrect\n");
> +
> +	return 0;
>  }

[Severity: Low]
This isn't a bug, but the comment above aqr_wait_reset_complete() still
says:

 * initialization has completed. Use presence of the firmware ID as
 * indicator for initialization having completed.

With the second poll, the function can now block for up to about 4 s
instead of 2 s. A return value of 0 can also mean the firmware ID is
present but provisioning wasn't confirmed, either because the poll timed
out or because the RSVD_STAT1 read failed.

Should the comment be updated to match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-aquantia-poll-global-status-register-v3-1-c805647a60b4%40oss.qualcomm.com
