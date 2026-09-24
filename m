Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222B4E73B1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286896; cv=pass; b=E1qREQ2C8/g3CI/Dui3/De127RikuCD+lRKWaejADOr4frCTZ23dE3cAYVjpaucYi4sqToJA5apVEyz/j+rHOxP1SrJnmapWU1ChfKLr8YMco6i1ZSLAQH5v3+5IHLGBlpxsZ/BMwSYa2cG6XrFtfAnPT4flCTFwRjajFZmP/QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286896; c=relaxed/simple;
	bh=IUNkv3tLBxmkJwT8YGdIbA8H6aZ+efOKL0YyyQVEbVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaN7AX5bWFj+XVNcEChdy3goPeG9vWTrArb00y7I192gMdBeF1Yitu8sIiYEqA0R2r/AonTKdR9n55oX6OuMc+V60kDxfMAYYWP94KDc3mVTnbiCP9T70VHDwlbd9z/IpI7QOCTRcI2tWHibaaaFjKy3HxBvgoPXCJ4wpp7a5Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGQkL3jS; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGQkL3jS"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-1433e1e7759so92c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286894; cv=none;
        d=google.com; s=arc-20260327;
        b=IYNuaJTRlnRMYpJ4F5He8fDGP2ynzNeLyWBxJRFUYUWxFNj6aaJlhTtH5dz25+n8BN
         JQSnlto0R0P7PDnzX9B5ASnuVSGzKF5u7uTzKhgXUH2dJhKgPzltfoTYIpjszEF1A1hX
         x4KxgXuid9b1HpbydFOqhjJifYGTy0KNxcEDLuQeSMAxu8ILNJ8KUm4yOhv79joJmhsK
         fIo2LTu8UKwSLZ5Kt+O64CyaCsfAMaS5fstGN0uNWjjACZn/IhAclv4TkaL/aU+PyVx9
         qGtLkr20jozYcGMhmV4AwuPmlfWZPu5EtJtj8ibog56HQcKYh/Z0+emKP6mDG4coZUQt
         kJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oE7svzhEf022G5qCXjn73Iy6aMVX182hm8bk8JwbE4=;
        fh=YjHijYG86emiUzt7xj7ppc0ROTKSdX1yE8FQuvy37nU=;
        b=chPBEcPk28ikT2eSAyC9OQANJv3xtayP0sfN9pmU4MLeCU5GpuQrKgIQzUqVhUXnVA
         E2H17mvTigrpOV/YTK9WEyt13paeAM8O37fKYut1jdsKCDMBizZDG8N56s8JZINy4DsD
         2O9XEHHRnRlVY/SHGxzdhuW+BEWpqJwCZTD7LjZQ9avGpF2NZ9NTqw5VWDMpaar/Uzra
         dkSbqnHVB1U1Q1vtSioTiqbghW4WquA6vXpFCQC7cKNdTLAzE+V+E5uRzlOALUD1DTw2
         hlk0D4M5fmFs8dqcjXGW9uW5BF+mjE19nZ2KEHwmMHsxgUNdv5DKQ4gMiQFOS2S5mNM6
         bj/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286894; x=1790891694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oE7svzhEf022G5qCXjn73Iy6aMVX182hm8bk8JwbE4=;
        b=GGQkL3jSgorCeEJUlMEuaOravZIFFtVGRFQJUCXC0yprFKYOYTgVO4KZ3dfzqCLwpz
         rHSnFhiTUsYzlZdosNPFcTHcdxKo1obbIL4B9Kjd6T7icpXqzckH45+Mqm/EuZ9a8MIh
         81fKkGtiWaAo/31uXg0EnT8flLggal3Yghalmr35HO4YzDO6S9HmJPkEU1zq7E3MuQV5
         PenbXbgv6YEcndPvA6Pc+hvQd8utNsFapKopMVTpriGVMxwyu+YdYQ4AW/WTTM3LZq16
         0rhM3rUug7HCWtiSmRpQdl20E88/MofrLaJNTld40dJQWbilODrYHkrI698CYEcDbKfF
         45jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286894; x=1790891694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oE7svzhEf022G5qCXjn73Iy6aMVX182hm8bk8JwbE4=;
        b=NsPVmJWkrVODNeFsAbq+sldsJ1vCk0Q9TNBdWNgjdWMANUDZzOzME1uJkaqw58QJPE
         E79Aq0q3WvQVbg6InUhr6McZkjAGhbLPVg/DlYvOI/yq2DVTZ5AdYxtV30jkRwswcNyS
         d17Ow12ps8RZChYC3kUZM88fTOpkTLTiHC+Uay4B7u7V11MmrJ9qpf8Wrv26YPk36QYQ
         75OWtuUMt8Lq0jO4RuW7wHUtOxHAJss9c9XZXmJZdSv1G5MLQviHgFqOrosxXscDKIfA
         QiZmPETuw6waz0phEXKHT0wns6YaWg2R3bB36R8vfu3p9hXsj5ov7xdvtyS3B6Gh4JzA
         0+NA==
X-Forwarded-Encrypted: i=1; AKwUvByXh7bezONM6dyeNGwpCn94GBK3M6GV7BwUKTP7b6fvbKpT0UwQtQ5bZ8kWu4F4147SibgORKuqlL5SzTY=@vger.kernel.org
X-Gm-Message-State: AFuF++nNI8yUKjCGeQKDLfEBd4MqGp57HsebVyI31kXCLvMbbJ00r16n
	d4wxQDDbAjBJqj+11gckKW4cnrm6pPxrBDW7gfTqR6FGSwNxDG2DniW7+r8359YYsFy349SM6Z2
	Pfp8JcC98dGkHeDs6ViePCcKjA/QpB9A=
X-Gm-Gg: AYBFou2hoI6e/cpNbEO2Jll8E7e0/8J9vFHAYQFDu2wamJS5/10b1jGPT/sXN0O3U5m
	4zkVXNHZi8pOKMD/fkNRTPkk7t5LJ0KN/SZivxG4YVM5CKRuUIELPmPgdC7nWsQ5RtA5xHlMz+n
	1NitOh61AV9nzmhQdJMVIYUgpRu0bc/hB/VEuUoblXgb+AUlNcGYAJhaaJ2wydeiAHxrlFlo7F8
	u05X/2jmKbmRn4okdtiqyQQkkDSQzr3id4EzIba67yfIVgXvtQIdwpaF+7Kb8dQQux61jLHcctu
	lvm1YqyN9cjSqKWxVJsNhOhWb1TDT7Tz0FjxTH9+nNJa3pkO0A2xG+1R0D07u2BbxWA4GeTJzjZ
	uNr99myoveDww5SQwgHAs5QlfMq7Xtd05KRJjyqClgl3hH39tNw3w
X-Received: by 2002:a05:701b:4287:20b0:139:81c6:67a1 with SMTP id
 a92af1059eb24-145a619c425mr1306344c88.1.1790286894158; Thu, 24 Sep 2026
 14:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnq5_PsKKiOXPuH9c8n0u8viyg0u3rTeDnPoeDBk11MP4V_hg@mail.gmail.com>
 <20260924210523.13214-1-fbeltranmillalen@gmail.com>
In-Reply-To: <20260924210523.13214-1-fbeltranmillalen@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 17:54:42 -0400
X-Gm-Features: AclHuK-ygzQGsSs9ter1Q0JQvd72HzE4_8XQf238sK-jHrHnBZECxiZxUctAWQc
Message-ID: <CADnq5_MAs45uU91Px+6R8MQnkUEgf0s_x-NZexm_KZP6iNTH1Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: reset VI ASIC on MacBookPro14,3
To: =?UTF-8?Q?Francisco_Beltr=C3=A1n_Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
	amd-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Thu, Sep 24, 2026 at 5:05=E2=80=AFPM Francisco Beltr=C3=A1n Millal=C3=A9=
n
<fbeltranmillalen@gmail.com> wrote:
>
> On a MacBookPro14,3 with a Radeon Pro 555 (Polaris11), the framebuffer
> is at MC address 0 when amdgpu loads after a cold boot, as the firmware
> leaves it (MC_VM_FB_LOCATION =3D 0x007f0000), while the VBIOS ASIC_Init
> table places it at 0xF4_0000_0000 (0xf47ff400).  amdgpu reads the
> location once, at init, so after a re-POST (S3 resume or GPU reset)
> the framebuffer has moved and the driver keeps programming the old
> one: the SMU is handed a table that was never written and the GPU
> does not come back, which leaves the internal panel black.
>
> Resetting the ASIC on load makes ASIC_Init run before the driver reads
> the location, so the driver uses the VBIOS placement from the start and
> every later re-POST puts the framebuffer back where it already is.
>
> Add the Radeon Pro 555 used in this machine to the existing VI reset
> quirk table.
>
> Tested on a MacBookPro14,3 on 6.18.49 with the quirk table backported
> (the kernel also carries unrelated local PCI and ACPI patches for this
> machine).  The framebuffer is at 0x000000F400000000 after both cold and
> warm boot, and the GPU survived 9 S3 cycles (lid close and rtcwake, one
> of them with the lid closed for about 7.5 minutes and a USB-C disk
> attached), each followed by a few minutes of 3D load; no ring timeouts
> or VM faults were reported.  The reset adds about 0.23 s to amdgpu init.
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Link: https://lore.kernel.org/all/20260924132952.25054-1-fbeltranmillalen=
@gmail.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Francisco Beltr=C3=A1n Millal=C3=A9n <fbeltranmillalen@gma=
il.com>
> ---
> v2: new approach, as suggested by Christian and Alex: instead of
>     rewriting MC_VM_FB_LOCATION after every re-POST in gmc_v8_0
>     (v1, withdrawn), reset the ASIC on load through the existing
>     vi_reset_quirks table.
> v1: https://lore.kernel.org/all/20260924132952.25054-1-fbeltranmillalen@g=
mail.com/
>
>  drivers/gpu/drm/amd/amdgpu/vi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu=
/vi.c
> index 2cd6d7d77..a0435fd55 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -1397,6 +1397,7 @@ struct vi_reset_quirk {
>  static const struct vi_reset_quirk vi_reset_quirks[] =3D {
>         { 0x67ef, PCI_VENDOR_ID_APPLE, 0x0190, 0xe3 }, /* Radeon Pro 555X=
 */
>         { 0x67ef, PCI_VENDOR_ID_APPLE, 0x018f, 0xc2 }, /* Radeon Pro 560X=
 */
> +       { 0x67ef, PCI_VENDOR_ID_APPLE, 0x017a, 0xc7 }, /* Radeon Pro 555 =
*/
>  };
>
>  static bool vi_need_reset_on_init(struct amdgpu_device *adev)
> --
> 2.55.0
