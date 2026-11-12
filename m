Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794487845;
	b=3MKhpTRY+NAp/Th/QwaXx40x8vTW7O+q/xhW4r1658KuP5Xs6OtbjK5IIZ4zk9urdOdy
	 79rBlCF8+5TpzSpmjpzUSnXBcxESWSUaAa9Dhqv5pUmslcYKawLnfWchkrR7FKaRUdYX1
	 fxLEg6vrrZOIMePjGiYOdT4+ZW5xjtiKqK9MyEDzXoIrFrmeARQ/59PhQdDbDMBmjLXOh
	 gJ5v31ystMDb6BQRcuuNC0OIzwpJj87Q7NVWtUn21QRX2W60l1cKBjocUfUcCHCHlzjEV
	 lMZ538/s3eNy1uWG4NozM0xVFYc+cQUBl1WtrikmU6YpRz0Qxupk4C7JH8aeyNSjqLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
	b=RXUZ/99ntxWBcW45aC/fzJccHxMQYSSyf1uEDcLYPG+CM8kToSfgUY6V+t/jWd/KVUXP
	 JGmpA/oJgCseTW0hQ8UduG7Bbces+7XRHz8gtyvsaDc7KJfOxTjGclkHeMSuK4GtXW7Sp
	 JhUwSwQGIkpqKinxZeP0gc3w31F1F5uCSp1DXZIclK+PD0+D258rdN+x9e6VuEvDYBkG5
	 9st2KQMDG+FUn73NPUnApNx6qiwRwq8XC2+M/9woeE5qfv5HRMPECmsB6nEVtZ4rbKYsg
	 OO7+GJJ3soP9ZYGpCsD3OeWy5FvdjaSowSUgd8csN3gjBkEvPzOcSCV7j2v+tT75hdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egsq4o7R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0342606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0342606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egsq4o7R
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so6269519c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794487844; cv=none;
        d=google.com; s=arc-20260327;
        b=dRVpGbyF96f7oR71DgIAUnoV/IrhQADftKamGtAx2gUX7vz9uJQGSd8ec4BeW6YRim
         jJYB8ORDh4lWeaSkYQpWNY0QeAqAa5g5AprVK5goYNgD4h1cMi2W492AxG+yjK0IK+8i
         VZN1KFUXlyn4q0iyPIkN1dKEQxWX/AlR4FNw57BmDSXmA1wrDkmlsQc4pR+DXF9TMlSa
         fG4vBAFP1etQv75vFyncb2jyQ2fs47K1hKwC7czpOF686t/CFUFkmKrxxstwdtQH2JNM
         /af2kGc6RAVXVa9gqn8mzUR/MLJZ4mvH8Fbv/iIfJMXdcK4iWOaHSM9vVa83J7X02gHe
         yYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
        fh=p8MImcYU0ziuDRJz/+zrsTXZP+obi1cEQQEkz5z9odI=;
        b=o+FdQziuYX97uUb+E4+5Okm35mceSDT8mF4tzR5yuQsZFtevnK/1+OK8ZromN8+ZrD
         uB7Zn6ihEnpPJvsGaotsvr5kLdhOBiKDKUUUX8dfAKWTOzx9xXIvfUVuAeDApT5t2J0T
         oLHhSozYIvgGcNWhMy7y3T6MysM4OKs8io8HsBX8abf6SLJ+1IP5BEwtQ3+2K8K9Ppmx
         folj+ySy9Eib03h2PFJWHtI71EGKtR04lkyhhAbOzka3wkl9YCstnEvqvr6DtoMmFvTs
         G4Dj+dV/cvI3sI3XRvwrnAg2Z5L0wEAvDl5iUAPyi1Y2YxNnj/crOABHnn7MTeVuQ4xN
         S0vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487844; x=1795092644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
        b=Egsq4o7RUxtUqWQP0xuRF09bumu/ZWKK+RAmetdjLraeVC9iDjE2oV/svQD3s63ecM
         jSkyQCUqb/gBQn6e5xnUvjeTC8TunvGusUJ9Qz1XNH+KBsvbNofaDEYpM+ZcrKraXed4
         S0MEORv5Yf7xMoVonS1t9RUXDyOks1qLIwbpZJAGppHdHUO0f5uybz9wFn5G+vxQEOe6
         MTIrffxOwVnSTw7bdJvFXwrLNAGwyqIv737Ifm34T4A34pJ2Z8q9I0fSEWmbnY2Dlnhm
         q8pk/2vqILVZrhorV2G3vKwnfnmmEMdkVi6FSu9wFdl652Y3jdg82jUhO+y7vg+Q/XIj
         iMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487844; x=1795092644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ifj6UiXfbSJBfBSvReqtUSI9DQmeGitKOnO0xdeombg=;
        b=wvcpvXF5ggspAXDCw6Wrs1T6iiWj5PnRPxSmmodF3yEzc10rHNlU2gUKwrvda/jhhh
         XT2nL4mptj14a2y8hfZcKxQI3XXI8t/nRss/vMgOidGbrncZVzaRPrcj/x2OwWi03FGP
         vIM+rv2t5Ef79ZO429HEN45zj0qh0oPB9OU8OXJLs9ZQiclZ/qubAC4bUdL76DoCbqGl
         PKD8xIXeXfV4E1hrVc0XojsrPtQy1U6n7WsQ1bazISY932zWhq3AKVpRAZvi/yiyB3ad
         n9mPFDyhTBeqnBST1QP0zVj5x/0c+o9lXHsPhfNCMcuzEF07OA0y42MzD9uqVZ5szUSp
         Wxhw==
X-Forwarded-Encrypted: i=1; AL+hErFUuEMmajimKhdWmxCEHpcfJDjfX5nswY6vjlKesv6dty82AWX2VZlQd9Iln97hHzCW5NZw9FBNbw5UNLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZVDI/y1bHFdfa9UUIBO31M78XYOJufaj/YssKjCwuMacINU/F
	59YhpxJwVVYYb9I4itZ4cXh7c02sRg1a4TmC5Hu8znEWVzt46SAwRXzWP5FdP1HN6P+CwlCjyki
	mFd/C7Btsd+nOolYqtyYcDm7N/uoJ0XjhDMWc
X-Gm-Gg: AYBFou1DJGeBiBkaNd5O2wq7xPq5FTVTrsq+GPc6MAK0RbrT8QDDyztFwKc743WdLCp
	Rf2n7OxhOTann1FSWz8TyL6K0V+bJLoy2JSq1WSOtLUHUTACQmKh27PMx3vYQGqvur06p3Wey+1
	6sPVNca+P7cbudMMJwCZh8NDS/Ere5Zj6vWRJRWjyDbOXwVt0LDmn12VhKG+zfJcKGeXNli4K+G
	1//1BqZ8NEZ4+jQLLuu1PwaeWA8i24WABo0AYbRaX+tkfwaU1ZI2AtxpRD3LctqpkA1EJWbj/j0
	2qMibMveIVF3TUxvei647Awpu1YVFCGT4F0sZWJJdElefE+p6n0RPI3euE2nGzPMZu1pFCNbfCl
	6MYFzG/G+v+259izg/24oPuTziCjcRivbv/15Rg==
X-Received: by 2002:a05:7022:285:20b0:143:8860:afa1 with SMTP id
 a92af1059eb24-1b3c036c2cbmr5206179c88.46.1794487843798; Thu, 12 Nov 2026
 04:50:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
In-Reply-To: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 12 Nov 2026 15:50:31 +0300
X-Gm-Features: AclHuK9YSfZpEJ-wscqvwDM5JwyJ270P-Q2k4wqitCYhbsGJfgD_snqVmQhs_tc
Message-ID: <CAP1tNvQY3wzyXrXJmJ+MpdT5S2gSK5r91qA2rWtRW-NtN1QEnA@mail.gmail.com>
Subject: Re: [PATCH] spi: Fix runtime PM imbalance on pump transfer message error
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Mark Hasemeyer <markhas@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[root@diasom-evb ~]# rtcwake -s 15 -v -m freeze
rtcwake: assuming RTC uses UTC ...
Using UTC time.
        delta   = 39
        tzone   = 0
        tzname  = UTC
        systime = 1773421897, (UTC) Fri Mar 13 17:11:37 2026
        rtctime = 1773421858, (UTC) Fri Mar 13 17:10:58 2026
alarm 0, sys_time 1773421897, rtc_time 1773421858, seconds 15
rtcwake: wakeup from "freeze" using /dev/rtc0 at Fri Mar 13 17:11:14 2026
suspend mode: freeze; suspending system
[  195.026100] PM: suspend entry (s2idle)
[  195.026582] Filesystems sync: 0.000 seconds
[  195.031059] Freezing user space processes
[  195.032653] Freezing user space processes completed (elapsed 0.001 seconds)
[  195.033266] OOM killer disabled.
[  195.033547] Freezing remaining freezable tasks
[  195.049016] Freezing remaining freezable tasks completed (elapsed
0.015 seconds)
[  195.318497] xhci-hcd xhci-hcd.3.auto: xHC error in resume, USBSTS
0x401, Reinit
[  195.319141] usb usb3: root hub lost power or was reset
[  195.319588] usb usb4: root hub lost power or was reset
[  195.321839] usb usb8: root hub lost power or was reset
[  195.324626] usb usb7: root hub lost power or was reset
[  195.338354] xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS
0x401, Reinit
[  195.338996] usb usb1: root hub lost power or was reset
[  195.339443] usb usb2: root hub lost power or was reset
[  195.354495] xhci-hcd xhci-hcd.4.auto: xHC error in resume, USBSTS
0x401, Reinit
[  195.355136] usb usb5: root hub lost power or was reset
[  195.355584] usb usb6: root hub lost power or was reset
[  195.359476] rk_gmac-dwmac fe1c0000.ethernet: init for RGMII_RXID
[  195.384855] dwmac4: Master AXI performs any burst length
[  195.387322] rk_gmac-dwmac fe1c0000.ethernet end3: No Safety
Features support found
[  195.389691] rk_gmac-dwmac fe1c0000.ethernet end3: IEEE 1588-2008
Advanced Timestamp supported
[  195.392178] rk_gmac-dwmac fe1c0000.ethernet end3: configuring for
phy/rgmii-rxid link mode
[  195.442885] r8169 0004:41:00.0 end1: Link is Down
[  195.484890] r8169 0002:21:00.0 end0: Link is Down
[  195.490337] rk_gmac-dwmac fe1b0000.ethernet: init for RGMII_RXID
[  195.522987] dwmac4: Master AXI performs any burst length
[  195.524320] rk_gmac-dwmac fe1b0000.ethernet end2: No Safety
Features support found
[  195.526697] rk_gmac-dwmac fe1b0000.ethernet end2: IEEE 1588-2008
Advanced Timestamp supported
[  195.529185] rk_gmac-dwmac fe1b0000.ethernet end2: configuring for
phy/rgmii-rxid link mode
[  195.656869] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  195.760866] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  195.864875] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  195.968867] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  196.072873] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  196.073408] hdmi-audio-codec hdmi-audio-codec.9.auto: HDMI: Unknown
ELD version 0
[  196.176872] dwhdmiqp-rockchip fdea0000.hdmi: i2c read timed out
[  196.518457] OOM killer enabled.
[  196.518736] Restarting tasks: Starting
[  196.519279] pcieport 0000:00:00.0: no suspend buffer for LTR; ASPM
issues possible after resume
[  196.522351] Restarting tasks: Done
[  196.522832] random: crng reseeded on system resumption
[  196.523321] PM: suspend exit
[root@diasom-evb ~]# [  196.534793] mmc_host mmc1: Bus speed =
400000Hz (req 400000Hz, actual 400000HZ div = 0)
[  196.697114] mmc_host mmc1: Bus speed = 148500000Hz (req
150000000Hz, actual 148500000HZ div = 0)
[  197.068697] dwmmc_rockchip fe2c0000.mmc: Successfully tuned phase to 208

[root@diasom-evb ~]#

So,
Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>

>
> The current SPI message pumping code may drop the runtime PM twice when
> an SPI message cannot be sent:
>
> spi_master spi2: noqueue transfer failed
> rockchip-spi feb20000.spi: Runtime PM usage count underflow!
>
> Fix the problem by always keeping the runtime PM count increased when
> exiting __spi_pump_transfer_message(), as the caller handles decreasing
> it.
>
> Note, that the function already keeps the RPM usage counter increased
> for the error paths following after the prepare_transfer_hardware step.
>
> Cc: stable@vger.kernel.org
> Fixes: bef4a48f4ef7 ("spi: Fix null dereference on suspend")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> I noticed this with RK3588 system suspend/resume, which uses SPI based
> PMIC and runs into SPI transmission problems when the PM domain driver
> tries to disable regulators required by e.g. NPU or GPU domain. I've not
> yet checked too closely, but suspect Heiko's atomic SPI transmission
> support series might also help with fixing the actual failure.
>
> My patch is not really a v2, but Alexander Shiyan probably ran into the
> same issue before and came up with a way different patch and rationale:
>
> https://lore.kernel.org/linux-rockchip/20260806191854.922530-1-eagle.alexander923@gmail.com/
> ---
>  drivers/spi/spi.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index ce257b3ec530..4d9c5d026ff6 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -1967,7 +1967,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
>         if (!was_busy && ctlr->auto_runtime_pm) {
>                 ret = pm_runtime_get_sync(ctlr->dev.parent);
>                 if (ret < 0) {
> -                       pm_runtime_put_noidle(ctlr->dev.parent);
>                         dev_err(&ctlr->dev, "Failed to power device: %d\n",
>                                 ret);
>
> @@ -1988,9 +1987,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
>                                 "failed to prepare transfer hardware: %d\n",
>                                 ret);
>
> -                       if (ctlr->auto_runtime_pm)
> -                               pm_runtime_put(ctlr->dev.parent);
> -
>                         msg->status = ret;
>                         spi_finalize_current_message(ctlr);
>
>
> ---
> base-commit: 059518f775baecc9803fc97787bd0b17558f8047
> change-id: 20261110-spi-runtime-pm-fix-529325c25582
>
> Best regards,
> --
> Sebastian Reichel <sebastian.reichel@collabora.com>
>
