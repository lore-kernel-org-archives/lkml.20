Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE64B1D10
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382877; cv=none; b=Kp4eoBgO5T90F6tuJF5pZbZjUrq1YQid3/0hLs7sB2Ti+gCrON1IMQUHRgUU7p0fUNgT0M4CnbpOONCpjfNIOWFg+jyVKBmE2ddFIjwCCEXp9LAsv2Z8Nk/B2HMNbC9HTXYNnraMuk0raFvAIu3AdM+pbR9I7EXD8BZq02I1uts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382877; c=relaxed/simple;
	bh=lO7k2qeUlKTPLz1K+tJL8g8IOK76pGpsgZGLgAJJ/r4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=VnS/Cbr4gHnTLeKMLpffzJKq59kHiA5Q4QR7Mk4H9VhYYGJq5oOGelZX8SUiWMgOnQZY8XJL97yyD6iN8kDgxgIMPvXDTvtdqaZ1Fw+taeVTbXdLifjs4xN7BI6gKb8nDXocpp80raLBeGQ9mp/VHUSYmxqhK9ssS9Pk9QF1SPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oPm02eM0; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oPm02eM0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lO7k2qeUlKTPLz1K+tJL8g8IOK76pGpsgZGLgAJJ/r4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791382861; v=1; x=1791987661;
 b=oPm02eM0KcjWOpLUsjUlrO5eg6fDTVRhQoKlQ3QkFJOtf5BbZEo4BFHsGSddEx/clQG/SEdo
 jF+AdhXHZVMfwUdxzfvpGnXlyOKhi7mgMnhGXUasdAIpxn0VP0yUfHgh4c/Vl4HNooHyLeCRwgu
 yla3+A0tTdE8Yr1PsObwEN3o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 605dfb51341d1243;
	Wed, 07 Oct 2026 14:21:01 +0000
X-Mizu-Trace-ID: 605dfb51341d1243
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] drm/appletbdrm: Add suspend and resume support
Date: Wed, 7 Oct 2026 19:50:38 +0530
Message-Id: <E1AEF567-3705-4AE7-B409-6E6D70C505AC@linux.dev>
References: <586d0b39-40c8-4f3d-a786-c1085f87b858@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <586d0b39-40c8-4f3d-a786-c1085f87b858@linux.dev>
To: vasilij.kernel@tototo.si, Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: iPad Mail (24A446)



> On 4 Oct 2026, at 5:36=E2=80=AFPM, Aditya Garg <aditya.garg@linux.dev> wro=
te:
>=20
> =EF=BB=BFFrom: Vasilij Markin <vasilij.kernel@tototo.si>
>=20
> The driver has no USB power management callbacks, so the USB core
> unbinds it before system suspend and binds it again on resume. The DRM
> device is unregistered and registered again on every suspend and resume
> cycle, userspace driving the Touch Bar through it (such as tiny-dfr)
> loses its device, and the Touch Bar stays dark after resume.
>=20
> Implement suspend and resume with drm_mode_config_helper_suspend() and
> drm_mode_config_helper_resume(), so the device stays registered and the
> last committed state is restored on resume. If the device was reset
> while suspended, repeat the probe-time handshake first.
>=20
> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Mac=
s")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Vasilij Markin <vasilij.kernel@tototo.si>
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>

Could anyone please merge it if they are ok with it? Thanks.
> ---
> v2: Remove reset_resume
>=20
> drivers/gpu/drm/tiny/appletbdrm.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appl=
etbdrm.c
> index ef71b9957..c94ed1068 100644
> --- a/drivers/gpu/drm/tiny/appletbdrm.c
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -30,6 +30,7 @@
> #include <drm/drm_gem_atomic_helper.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_modeset_helper.h>
> #include <drm/drm_plane.h>
> #include <drm/drm_print.h>
> #include <drm/drm_probe_helper.h>
> @@ -821,6 +822,20 @@ static void appletbdrm_shutdown(struct usb_interface *=
intf)
>    drm_atomic_helper_shutdown(&adev->drm);
> }
>=20
> +static int appletbdrm_suspend(struct usb_interface *intf, pm_message_t me=
ssage)
> +{
> +    struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
> +
> +    return drm_mode_config_helper_suspend(&adev->drm);
> +}
> +
> +static int appletbdrm_resume(struct usb_interface *intf)
> +{
> +    struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
> +
> +    return drm_mode_config_helper_resume(&adev->drm);
> +}
> +
> static const struct usb_device_id appletbdrm_usb_id_table[] =3D {
>    { USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
>    {}
> @@ -832,6 +847,8 @@ static struct usb_driver appletbdrm_usb_driver =3D {
>    .probe        =3D appletbdrm_probe,
>    .disconnect    =3D appletbdrm_disconnect,
>    .shutdown    =3D appletbdrm_shutdown,
> +    .suspend    =3D appletbdrm_suspend,
> +    .resume        =3D appletbdrm_resume,
>    .id_table    =3D appletbdrm_usb_id_table,
> };
> module_usb_driver(appletbdrm_usb_driver);
> --
> 2.53.0
