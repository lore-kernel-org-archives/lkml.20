Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433057;
	b=5G9zOYDK7epI/cKN28OXJktZxzv1xS3IdTmtlo5XG3JFVci4JqqY2fG7TDfQSoPxEjEN
	 aQW/JChmeQmurhSgN2GxYXK9CxnCZHXh5V4gpLsUPMdxVVlZfLf45o7QC7l2JR23yh6v1
	 3tQja8mcDS8M3JlhSpR2lyvnLx4wiVh81YseH3FFmJ4zuXhMxTqfAtTUIB/QF6yUnJ0a2
	 yvrAsJ2PSc4m29kTJUs6en1KzKHA70kbPLfohtzvGoJuY8LIGZIDm0pCI7FMOxQY2rf/6
	 3Aq4L5mHEvcTlyog/LM+8x/rCYjSX+cXi2NhZvMb/VbhtK8Yp7m80fhoTnCqkKs/vwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=X8DRIAkCuEwr0UFRSVxQUwx/mwPLWUnxL0jdwqQvjbs=;
	b=tcsYeeZVhaJ59OeUXDLtwxT55FEozHwnfM4k7S6ganzGoaqJTo15XYqItI1uJ3rWAfsl
	 uiRpUxUiW78ESw4o/ss5qXnbb2xNLaK56qkDoEnoHyughv5mkuaxWnl5/91AcDqBS+0A/
	 1MEFcZAF8Zr0t/zYffVDwpqHsZyyj5T5gBpmkbNLOLI13qWjpKtinvD2Z017Axg3xz5WB
	 93aS4KkxOdrPLWdK93QHhJCqqv6nM/zonF5MeQHatVZbDFckERC9vkg84A936psxKwJ8U
	 RxtIQssntvJuc5zxbe+ObKrD+TyEfhOPnKtp4njtRhywqdvC/YGg8/UlOZmwlfw02pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=fRyw+W7V;
	arc=none smtp.remote-ip=212.77.101.12
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF888606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF888606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=fRyw+W7V
Received: (wp-smtpd smtp.wp.pl 24790 invoked from network); 31 Oct 2026 08:50:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1793433048; bh=X8DRIAkCuEwr0UFRSVxQUwx/mwPLWUnxL0jdwqQvjbs=;
          h=From:To:Cc:Subject;
          b=fRyw+W7VZoVbRvrORhxbAt0L9CGh6XvAEo/GfVhht1PsTRzjTaJEhhPMQFEKNAKD6
           cPuuJ44CYGOI/IMa34XS6sBnjEi/uH/BJm1oGaqbOSaUScqEif03mZL5qr8Xz0dX4K
           ooSVNFwBKLwgsFQTqas0stVNtA4luZrqPwKm/uv1fjicbDgoyEuZ/baFWBXPVZ5rC7
           ZitFB/6RwI3cFBusGYLhqsoiXRAo7u+jkjunKCATM4XlQUGBEs0jRt8nRDlS/gqxFu
           BvQo49GPMEdwzE8Zj6up8ErlrCFD0reYJ/jAybnvPqluorMklKIReodDtaFT7x7jH7
           t5eu6yqxu2ACg==
Received: from localhost (77-236-11-144.static.play.pl [77.236.11.144])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <apetrozzelli@gmail.com>; 31 Oct 2026 08:50:48 +0100
Date: Sat, 31 Oct 2026 08:50:47 +0100
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: apetrozzelli@gmail.com
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: rt2x00: rt2800lib: fallback to
 default RF config when EEPROM_NIC_CONF0 is 0x0000
Message-ID: <20261031075047.GA30810@wp.pl>
References: <20261031-fix-rt2800-eeprom-nic-conf0-zero-v1-1-a118ee775fcb@gmail.com>
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
In-Reply-To: <20261031-fix-rt2800-eeprom-nic-conf0-zero-v1-1-a118ee775fcb@gmail.com>
X-WP-MailID: 1a7291901dc3cb2ef5d7fdb4ff2ff538
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [sbLR]                               

Hi

On Sat, Oct 31, 2026 at 12:57:36AM +0100, Alessandro Petrozzelli via B4 Relay wrote:
> From: Alessandro Petrozzelli <apetrozzelli@gmail.com>
> 
> On some Ralink PCI/PCIe wireless cards, such as the AzureWave AW-NE766
> (Ralink RT2790 / RT2872, PCI ID 1814:0781, subsystem 1814:2790) bundled
> in the ASUS EeeBox PC B202, reading EEPROM_NIC_CONF0 returns 0x0000
> instead of 0xffff when the EEPROM word is uninitialized.
> 
> Currently, rt2800_validate_eeprom() only triggers the default RF2820
> (1T2R) configuration fallback when EEPROM_NIC_CONF0 is 0xffff, unlike
> other EEPROM validation checks in the same function (such as LNA gain
> fields) which already check for both 0x00 and 0xff. As a result,
> EEPROM_NIC_CONF0_RF_TYPE remains 0x0000 and rt2800_init_eeprom() aborts
> device initialization with -ENODEV:
> 
>   rt2x00_set_rt: Info - RT chipset 2872, rev 0200 detected
>   rt2800_init_eeprom: Error - Invalid RF chipset 0x0000 detected
>   rt2x00lib_probe_dev: Error - Failed to allocate device

Please check if your kernel contains:

commit 0a2581cbae9e442835f68d22044157db61cdf54d
Author: Corentin Labbe <clabbe@baylibre.com>
Date:   Fri Jul 3 13:49:32 2026 +0000

    wifi: ralink: RT2X00: init EEPROM properly

The problem could be a issue fixed by this commit and 
other EEPROM values would be read properly.

> Since 0x0000 is never a valid RF_TYPE (valid chipsets start at
> RF2820 = 0x0001), extend the EEPROM_NIC_CONF0 fallback check to also
> handle 0x0000 so that these cards initialize and operate properly.
> 
> Signed-off-by: Alessandro Petrozzelli <apetrozzelli@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> index 2e2e382b6..dda5ba2ad 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> @@ -11047,7 +11047,7 @@ static int rt2800_validate_eeprom(struct rt2x00_dev *rt2x00dev)
>  		return retval;
>  
>  	word = rt2800_eeprom_read(rt2x00dev, EEPROM_NIC_CONF0);
> -	if (word == 0xffff) {
> +	if (word == 0xffff || word == 0x0000) {
As you pointed, is safe to have this check since 0 is not valid, so ...

Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

>  		rt2x00_set_field16(&word, EEPROM_NIC_CONF0_RXPATH, 2);
>  		rt2x00_set_field16(&word, EEPROM_NIC_CONF0_TXPATH, 1);
>  		rt2x00_set_field16(&word, EEPROM_NIC_CONF0_RF_TYPE, RF2820);
> 
> ---
> base-commit: 2c50cd5d10e8723797f28c7978f1f61688e0c0d2
> change-id: 20261031-fix-rt2800-eeprom-nic-conf0-zero-acf88f6ddd60
> 
> Best regards,
> --  
> Alessandro Petrozzelli <apetrozzelli@gmail.com>
> 
> 
