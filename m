Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B1414A3B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337096; cv=none; b=gMU72J0hXhly5z7FmLm9EUihfCHePjoVMEhM7LiiFVjXYzgBEXRfSuQ5qqCyoXu7oansD5qvWjwU8RwsWugkbMRW9wtktkVA1N3D6cNvJgeZG3XW0VQ3LEFKgxcEWHt0BO/d86kMunm/dgYXp6e4Z7u7ELBJnpQ7HmWxlLlHSZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337096; c=relaxed/simple;
	bh=W5HjZtvkEZP4bI+XdBWSmYCpMoNGX4TaFCAmHfxFcFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzdX1C95BF0jMBTi5xqxz2wR6q7nwNhLEql1p3ykkEkgv8iiiAJuFEgt/Vkw5iQFXMcwoX17QPETNptddCfRkwQvfGrP64tpeGbZ9vjPjDbiQuycYUQ4q6EYq/FAJGlEKSWYl0e/FBDPXa+oBJ23CUwb7otP2YT4bj+SLcGhXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jeLJQeE4; arc=none smtp.client-ip=95.215.58.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jeLJQeE4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W5HjZtvkEZP4bI+XdBWSmYCpMoNGX4TaFCAmHfxFcFw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790337092; v=1; x=1790941892;
 b=jeLJQeE4CjnVJJy/VNoOjJmxdPtLoUoSMcctSBjQXIh6f6jlVDXqcfEtLMfMsHhJspf4hobB
 3gQEgkkrSh2cEgmNS1omiMGpUXvGqUWdHcjuHncE+nrC9FQeO0GZsWVuToblFhpBnEEnCvcSKAv
 EJUFoZ/hVb7eeBokSkD1BNnA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9aae308e809086b9;
	Fri, 25 Sep 2026 11:51:31 +0000
X-Mizu-Trace-ID: 9aae308e809086b9
X-Migadu-Flow: FLOW_OUT
Message-ID: <988a32d4-6b76-48f3-bcc1-3634b4a02c36@linux.dev>
Date: Fri, 25 Sep 2026 17:21:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/appletbdrm: Add suspend and resume support
To: vasilij.kernel@tototo.si, Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>
References: <20260924-appletbdrm-pm-v1-1-0e5432132161@tototo.si>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <20260924-appletbdrm-pm-v1-1-0e5432132161@tototo.si>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Vasilij

Thanks for the patch

> From: Vasilij Markin <vasilij.kernel@tototo.si>
> 
> The driver has no USB power management callbacks, so the USB core
> unbinds it before system suspend and binds it again on resume. The DRM
> device is unregistered and registered again on every suspend and resume
> cycle, userspace driving the Touch Bar through it (such as tiny-dfr)
> loses its device, and the Touch Bar stays dark after resume.
> 
> Implement suspend and resume with drm_mode_config_helper_suspend() and
> drm_mode_config_helper_resume(), so the device stays registered and the
> last committed state is restored on resume. If the device was reset
> while suspended, repeat the probe-time handshake first.
> 
> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Vasilij Markin <vasilij.kernel@tototo.si>
> ---
> Tested on a MacBookPro16,2 with this change backported to 7.2.7, deep (S3)
> suspend by closing the lid, tiny-dfr 0.3.7. Without it the driver is probed
> again on every resume and systemd stops tiny-dfr; with it tiny-dfr keeps
> running, the driver is not probed again and the Touch Bar shows its content
> right after resume. The reset_resume path is untested: the device never came
> back reset.
> 
> Kernels before commit 3d95f93b30b8 ("drm/appletbdrm: Convert to atomic_create_state")
> also need the plane reset hook to free the existing state, otherwise
> drm_mode_config_reset() on resume hits WARN_ON(plane->state) in
> appletbdrm_primary_plane_reset() and leaks the old state. 7.2.y is such a
> kernel; the tested backport carries that change as a separate patch.
> 
> Built on drm-misc-next (c4c54ffd6) with W=1 without warnings.
> ---
>   drivers/gpu/drm/tiny/appletbdrm.c | 43 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> index 4297d9c11..024ad8bf6 100644
> --- a/drivers/gpu/drm/tiny/appletbdrm.c
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -30,6 +30,7 @@
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_modeset_helper.h>
>   #include <drm/drm_plane.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -821,6 +822,45 @@ static void appletbdrm_shutdown(struct usb_interface *intf)
>   	drm_atomic_helper_shutdown(&adev->drm);
>   }
>   
> +static int appletbdrm_suspend(struct usb_interface *intf, pm_message_t message)
> +{
> +	struct appletbdrm_device *adev = usb_get_intfdata(intf);
> +
> +	return drm_mode_config_helper_suspend(&adev->drm);
> +}
> +
> +static int appletbdrm_resume(struct usb_interface *intf)
> +{
> +	struct appletbdrm_device *adev = usb_get_intfdata(intf);
> +
> +	return drm_mode_config_helper_resume(&adev->drm);
> +}
> +
> +static int appletbdrm_reset_resume(struct usb_interface *intf)

We don't need a reset_resume function as the USB device is virtually 
exposed by the t2bce driver and current implementation doesn't reset the 
device in any case. If the need arises, it can be added in a later patch.

> +{
> +	struct appletbdrm_device *adev = usb_get_intfdata(intf);
> +	struct drm_device *drm = &adev->drm;
> +	int ret;
> +
> +	/*
> +	 * A reset puts the device back into its initial state, where it
> +	 * expects the same handshake as during probe
> +	 */
> +	ret = appletbdrm_get_information(adev);
> +	if (ret) {
> +		drm_err(drm, "Failed to get display information\n");
> +		return ret;
> +	}
> +
> +	ret = appletbdrm_signal_readiness(adev);
> +	if (ret) {
> +		drm_err(drm, "Failed to signal readiness\n");
> +		return ret;
> +	}
> +
> +	return drm_mode_config_helper_resume(drm);
> +}
> +
>   static const struct usb_device_id appletbdrm_usb_id_table[] = {
>   	{ USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
>   	{}
> @@ -832,6 +872,9 @@ static struct usb_driver appletbdrm_usb_driver = {
>   	.probe		= appletbdrm_probe,
>   	.disconnect	= appletbdrm_disconnect,
>   	.shutdown	= appletbdrm_shutdown,
> +	.suspend	= appletbdrm_suspend,
> +	.resume		= appletbdrm_resume,
> +	.reset_resume	= appletbdrm_reset_resume,
>   	.id_table	= appletbdrm_usb_id_table,
>   };
>   module_usb_driver(appletbdrm_usb_driver);
> 
> ---
> base-commit: c4c54ffd65555ac5316f8faf4d7dc8c815877937
> change-id: 20260924-appletbdrm-pm-6bd220385beb
> 
> Best regards,

