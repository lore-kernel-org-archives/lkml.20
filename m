Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8953FD2A;
	Tue, 22 Sep 2026 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079846; cv=none; b=hHYiVbkEJGft5ssMEVtJyU5vbWgErK8ozVDksEbhixPtcE/iR4Ue/AkAhi5L3cM0jSb1NfCJHWacwXT/xggvv85OuHBRfRKy+mrokVsLBa3Eytwbcasx++tQDzjyutF2XvAyG1W2pHOKcat+HJiuBp6b3JTaAs1hhovvr7blILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079846; c=relaxed/simple;
	bh=cONq4ZDe3CEnWfTo5rX7DeMxW9rA954Kqc8KaB5bDjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAJ3RXAvbicEMQnU/P0Nq63OARitSR0qSiXVubY2vvx0MWngeIhpHbP7UDE8NwAmImM53bKhqscwIrICkTMC4GLCd43ej8DS0nJfV4a8IP5YTZ3wWeFL5LdN4u465gv7yThHYv8XS9kn6FW4wIh0hguCK1Oeg6grI03Qw+uZ9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcRgEXYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcRgEXYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F12D1F000FF;
	Tue, 22 Sep 2026 12:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790079844;
	bh=MzHP5ZhbBCLBjgtLBggx2z6Ty/BqHM4s3azSzDujRm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gcRgEXYfI/I5l3hVEQS7MztkcagJs0wUB0GdSqmQbVGq4U2sW9FbTgW+omsbsdmBi
	 TRoxP3NZKhDRTY9l4UjWAAb6KC3ihbKGvILYTWhm4agsWqKmTYYtz5w3oKYTdE88Cu
	 kdLplDIdj52yixQTCYV1YzwzhMY8cLdi6PP8RFuJIcYiPutmotqmwKc/a8nqDKu5sZ
	 6m6qIY5hl8oxFa+KqKyjWR+cVuFtwURSktyiHvkrZRjOMV8tleDh8cnxlJZc4WvQNs
	 9rlsEe5z9eZngRo0IMHjUaypzGrJZhd1pkxZ/AZ5C9VeGidBXUi3FZEM3EvWZAQLpB
	 aurzCk9YcBA9g==
Date: Tue, 22 Sep 2026 13:24:00 +0100
From: Lee Jones <lee@kernel.org>
To: chiffa <chiffathefoxx@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH] mfd: max77705: Mark PASS2 revision as supported
Message-ID: <20260922122400.GD3277918@google.com>
References: <20260914-max77705-pass2-supported-v1-1-a453f0b14b2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914-max77705-pass2-supported-v1-1-a453f0b14b2a@gmail.com>

On Mon, 14 Sep 2026, chiffa wrote:

> The existing driver takes a safe approach and only probes on tested
> MAX77705 revisions. The only tested revision at the time was
> PASS3. PASS2 chips are present in the Samsung Galaxy S10/S10+/S10e
> devices.
> 
> Testing on the S10 and S10+ shows the driver operates correctly on
> PASS2: interrupts are registered and fire, bind and unbind release the
> I2C device cleanly, and the charger and fuel gauge report plausible
> values, charging the battery to the same voltage as the vendor kernel,
> haptic feedback works.
> 
> Replace the single-revision equality test with a bitmask of supported
> revisions so that further revisions can be added as they are tested.
> A bitmask is fine here since the revision bitfield is only 3 bits wide
> (maximum value of 7) and is always AND'ed by MAX77705_REVISION_MASK
> before matching the revisions.
> 
> Link: https://lore.kernel.org/all/20251023131732.GN475031@google.com/
> Signed-off-by: chiffa <chiffathefoxx@gmail.com>

You need to use your real name.

> ---
> Take into account the discussion that Lee Jones <lee@kernel.org> and
> Eric Gonçalves <ghatto404@gmail.com> had in
> [https://lore.kernel.org/all/20251023131732.GN475031@google.com/] by
> adding a MAX77705_SUPPORTED_REVISIONS define with a bitmask of all
> tested revisions.
> 
> The base commit is from the for-mfd-next branch in
> [git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git].
> 
> # Test Results
> Second revision MAX77705 can be found on Exynos 9820 devices, such as
> Samsung Galaxy S10/S10+/S10e. Eric mentioned that S22 also features this
> revision, but I don't have it at hand to verify. My tests cover S10
> and S10+ devices. The tests should be exhaustive and prove the
> driver is operating correctly. Please let me know if there are other
> tests I can run to make sure everything is ok.
> 
> ## Device Tree
> DT nodes relevant to the MAX77705 driver that I used for testing can be
> found in my private u-boot tree:
> - [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-common.dtsi#L184]
> - [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-common.dtsi#L15]
> - [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-beyond1lte.dts#L35]
> - [https://github.com/chiffathefox/u-boot/blob/dc584dd2fcdcd3b5234a3e2629651928b722e5f5/dts/upstream/src/arm64/exynos/exynos9820-beyond2lte.dts#L35]
> 
> ## Interrupts
> Interrupts are correctly registered and fire on both devices:
> ```
> /home/user # grep -i max /proc/interrupts
>   97:        687          0          0          0          0          0          0          0  gpa1                6 Level     max77705
>   98:          0          0          0          0          0          4          0          0  max77705            0 Edge      max77705-charger
>   99:          0          0          0          0          0          2          0          0  max77705-charger    6 Edge      chgin-irq
>  100:          0          0          0          0          0          2          0          0  max77705-charger    7 Edge      aicl-irq
>  110:          0          0          0          0          0        683          0          0  max77705            2 Edge      max170xx_battery
> ```
> 
> ## Bind/unbind
> The driver correctly binds and unbinds. I can communicate with the
> device after unbinding the driver, so it's releasing the i2c correctly:
> ```
> /home/user # echo 1-0066 > /sys/bus/i2c/drivers/max77705/unbind
> /home/user # i2cget -y 1 0x66 0x00
> 0x15
> /home/user # i2cget -y 1 0x66 0x01
> 0x02
> /home/user # echo 1-0066 > /sys/bus/i2c/drivers/max77705/bind
> [ 1481.988830] max77705-rgb: Failed to locate of_node [id: -1]
> [ 1481.989191] max77705-charger: Failed to locate of_node [id: -1]
> [ 1481.989549] platform max77705-haptic: DMA mask not set
> [ 1481.990762] input: max77693-haptic as /devices/platform/soc@0/15d600c0.usi/15d60000.i2c/i2c-1/1-0066/max77705-haptic/input/input2
> ```
> 
> ## Sensors
> Sensors report realistic values when charging/discharging. Temperature
> sensors are broken. On S10 battery temperature is always reported as
> -20 deg Celsius, and on S10+ it sometimes changes when I reboot into an
> Android kernel. Seems like downstream kernel is the one responsible for writing
> the temperature measurements into that register, but it doesn't happen for me
> on my S10. Downstream kernel is reporting the same temperature as
> mainline for both devices.
> 
> S10:
> ```
> /home/user # sensors max77705-isa-0000 max170xx_battery-isa-0000
> max77705-isa-0000
> Adapter: ISA adapter
> VBYP_REG:      4.58 V
> VSYS_REG:      4.29 V
> IIN_REG:     466.00 mA
> ISYS_REG:    233.00 mA (avg =  +0.25 A)
> 
> max170xx_battery-isa-0000
> Adapter: ISA adapter
> in0:           4.28 V  (min =  +3.00 V, max =  +4.26 V)
>                        (avg =  +4.28 V)
> ERROR: Can't get value of subfeature temp1_min: Can't read
> ERROR: Can't get value of subfeature temp1_max: Can't read
> temp:         -20.0°C  (low  =  +0.0°C, high =  +0.0°C)  ALARM (LOW, HIGH)
> curr1:       253.00 mA (avg =  +0.24 A)
> 
> /home/user # cat /sys/class/hwmon/hwmon1/device/status
> Charging
> ```
> 
> S10+:
> ```
> /home/user # upower -d
> Device: /org/freedesktop/UPower/devices/battery_max170xx_battery
>   native-path:          max170xx_battery
>   power supply:         yes
>   updated:              Fri Sep  4 23:18:43 2026 (27 seconds ago)
>   has history:          yes
>   has statistics:       yes
>   battery
>     present:             yes
>     rechargeable:        yes
>     state:               charging
>     warning-level:       none
>     energy:              7.84905 Wh
>     energy-empty:        0 Wh
>     energy-full:         9.85235 Wh
>     energy-full-design:  13.2593 Wh
>     voltage-min-design:  3.35 V
>     energy-rate:         0.474233 W
>     voltage:             4.10625 V
>     charge-cycles:       150
>     time to full:        4.2 hours
>     percentage:          74%
>     temperature:         30.8 degrees C
>     capacity:            74.3052%
>     technology:          lithium-ion
>     icon-name:          'battery-full-charging-symbolic'
>   History (rate):
>     1788563923	0.474	charging
>     1788563893	0.352	charging
>     1788563863	0.983	discharging
> 
> Device: /org/freedesktop/UPower/devices/line_power_max77705_charger
>   native-path:          max77705-charger
>   power supply:         yes
>   updated:              Fri Sep  4 21:24:00 2026 (6910 seconds ago)
>   has history:          no
>   has statistics:       no
>   line-power
>     warning-level:       none
>     online:              yes
>     icon-name:          'ac-adapter-symbolic'
> 
> Device: /org/freedesktop/UPower/devices/DisplayDevice
>   power supply:         yes
>   updated:              Fri Sep  4 23:18:43 2026 (27 seconds ago)
>   has history:          no
>   has statistics:       no
>   battery
>     present:             yes
>     state:               charging
>     warning-level:       none
>     energy:              7.84905 Wh
>     energy-full:         9.85235 Wh
>     energy-rate:         0.474233 W
>     charge-cycles:       N/A
>     time to full:        4.2 hours
>     percentage:          74%
>     icon-name:          'battery-full-charging-symbolic'
> 
> Daemon:
>   daemon-version:  1.91.0
>   on-battery:      no
>   lid-is-closed:   no
>   lid-is-present:  no
>   critical-action: PowerOff
> ```
> 
> ## Charging
> Mainline driver charges the battery to the same voltage as downstream,
> which happens to be 4333 mV on my S10+.
> When charging wirelessly, the device accepts charge, and sensors
> correctly report the charge current, but the driver reports battery
> state as 'Discharging'.
> Since the driver doesn't support Fast Charging, charging wirelessly is
> faster than using a cable.
> ---
>  drivers/mfd/max77705.c               | 2 +-
>  include/linux/mfd/max77705-private.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
> index e98c76d6b699..6cc65ca53f24 100644
> --- a/drivers/mfd/max77705.c
> +++ b/drivers/mfd/max77705.c
> @@ -105,7 +105,7 @@ static int max77705_i2c_probe(struct i2c_client *i2c)
>  		return -ENODEV;
>  
>  	pmic_rev = pmic_rev_value & MAX77705_REVISION_MASK;
> -	if (pmic_rev != MAX77705_PASS3)
> +	if (!(BIT(pmic_rev) & MAX77705_SUPPORTED_REVISIONS))

I'm not keen on this approach.

Firstly, the list of supported revisions isn't being maintained in this
file, meaning that developers or interested parties need to go looking
for the list.

Secondly, even if we were to move the list into this file, it's still
not obvious which devices are supported.

Seeing as the list is small and is likely to stay that way, a think a
simple && or || in an if() is fine.  If the list does get long then a
switch() becomes the correct tool.

>  		return dev_err_probe(dev, -ENODEV, "Rev.0x%x is not tested\n", pmic_rev);
>  
>  	/* Active Discharge Enable */
> diff --git a/include/linux/mfd/max77705-private.h b/include/linux/mfd/max77705-private.h
> index 214de7feeb8c..a7ff045bb78e 100644
> --- a/include/linux/mfd/max77705-private.h
> +++ b/include/linux/mfd/max77705-private.h
> @@ -57,6 +57,8 @@ enum max77705_hw_rev {
>  	MAX77705_PASS3
>  };
>  
> +#define MAX77705_SUPPORTED_REVISIONS (BIT(MAX77705_PASS2) | BIT(MAX77705_PASS3))
> +
>  enum max77705_reg {
>  	MAX77705_PMIC_REG_PMICID1		= 0x00,
>  	MAX77705_PMIC_REG_PMICREV		= 0x01,
> 
> ---
> base-commit: 5a5f978cf3cd2f50b9e123f851f5c6577519ee89
> change-id: 20260913-max77705-pass2-supported-40551b2ff71f
> 
> Best regards,
> --  
> chiffa <chiffathefoxx@gmail.com>
> 

-- 
Lee Jones
