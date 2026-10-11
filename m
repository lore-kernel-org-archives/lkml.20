Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41362BEC3F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791692663; cv=pass; b=tLAylGlHMe3iPoC0A2rRieUPaQaG/lZsDf4mUlBOnf1LQV90fczM4qi2WsBXo0APTTuvEHNfQtjh3iHAuMLBJqebJXb/jab28BdI5aSdWPCB9LV3pLY9C+unmZU61NJYW7uchzb5rlE2d7CvV2TP9E6kfmO8gcsfF645XX/l/KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791692663; c=relaxed/simple;
	bh=qdxE0RHmxCdnGtaZYVfxmF/aX520nxo6WdF2env194g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luAk33PmqG+buIQ5fPvT9DrBsoeErEdmaZfueVpucbK43p7DSXxWJoksmYpdjN8BxEkTag2ha/bqw+o0uXUYPNokOnMqg/ycIV7qFHoah5E1BtS3eVdgOB7vuBYNe1DiJR/R+k2FjrL6uAo4qZsUe79XAqEyi1TfaC/3hH5L05M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfNhN1zS; arc=pass smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfNhN1zS"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a7882fb706so7677751fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791692660; cv=none;
        d=google.com; s=arc-20260327;
        b=Hg13hlVJ1GB32pLNHl1Rb+kviIG4V0C0aWMFaffiJtM3aIQbZTnKX9D5ysH3Hr9LSf
         nyTkoIbrBZaWVkHSM+i6qzVguVi+gYTbUXMV8cDs7VogtiJrJ5QGAmJnd6uqRXoQuNFB
         efuok/Ud7NM5rMvLiGmp3P/sM/mLrXA7kzLf6ivi8IzXObNpau1HWGT83Rtsb5QmK8Ad
         yAvDeGhJ3AA1cya2E5iA3qtDmT9tTdGIBfHrQjjf0OAOuFfqz7AETQT6r1iiW0+KTX0S
         vVCZfipNUVoOitxX1qqU9q6y7B6Z+4C2A6KomXIzkUWE+HdJYeghQqOq7i+pgP+w/DJG
         7+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VhZc0ul596MdstjFona8ML1ytD+B6YUHJy1OvUi+4LI=;
        fh=wI7OtBNgJoWAODco6A1jadN+Qy9yQfAOjQhnFLEUQlQ=;
        b=fndLedb4u0EaLqD9XDTYV/pK0Jiel3FJg0ghLxpVtq1XcjC37TFaltdIEr66AjrJjE
         FbpvzWpldQEr9phHBzxwwmTYjN4qiaBLvlS6sIZYEQKnUJR8M+w5Pc5zQoiJhciUyYyt
         sIgbuDXc0Ry7xC8JSwbYOCbML14MpA9ooehjkZZRVG1AAmBirhWlv6fhiShiKj1BmNbi
         7WtIKB+LJcrATGPBUv6sfjaadAOfC6l1lnjcJORANaPXeiqMQ99qD2SGscNi6omuv6lG
         pL2znCvfop56HZtbw4vBL+WoUOtMlK8gNT/Uqbm98h93rlmg5cRCCBay62sn4IlNCkGR
         BORw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791692660; x=1792297460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VhZc0ul596MdstjFona8ML1ytD+B6YUHJy1OvUi+4LI=;
        b=rfNhN1zSVCKpko3buLAsnBNMoCJlRFVA3akvZkd5pItIqMTdrB5w/VDWNfFGEpIck2
         Trsvdo1Ryc63+upWm05mysSO4ymHbqrpQtW5JzDKe4Brsre0wmpyHj74fC7wQvUeBViK
         QZyPemVaoKQMoNcmszJ2KnNyhHrefIg6qYpc3VEF4Ehk00lmgl4Lm+SLZ5tq/aHdTTNj
         p77CxAibofdiYErNUChaQawsajTCkMDAvwm+Vr1/qRqKVZLg8fgGQYP0nhu/6LsYf577
         Hy9phEtbZUVLgs9+bFea6MtDI08DrYrxDwqmWRIV+gtABVyItlBDlMvgIB/0CgGnAm9T
         IT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791692660; x=1792297460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhZc0ul596MdstjFona8ML1ytD+B6YUHJy1OvUi+4LI=;
        b=pWqHc7pYXVssGv3m7wR1gV7E/X5DyiK69oPWzAb7oDF9+xlV/Max4vzZiWcwELeJ1D
         w6AHVjC/yT7UFWcfpI7C/qeZCEBG7G5i0RBW1QNv1AJz/YCcV84sr9EEV8uQECfTeOwQ
         9hnJU6LyAi8dI6oFpFm04n6GzTQSj9j8vPkBGbEktJrUiT+tQ5PuKOThBClZegHV/dWx
         nM7kzEoeAtenO/APfkyCeg56bsgfFMaWDArLn123fpr4OggkkH1/Ssvz61L423RDmfDq
         BvF0FB3KeVEWWt3Jt4DZjmEV0ecgtRz+oM9VkeHMo64nfg0CDdPeUBWCzd3qGfk/Iuuo
         7V9Q==
X-Forwarded-Encrypted: i=1; AKwUvByKPPBAhwGI1pkogA1rXcfjFY+z+gzcwaWnolj78mOPpzLCeuCDcM771PtTdvmiMlvBEnZZHkaFZCsWLSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtywlvMfafbmQIs+CeNSdBO1AAh7CDdLq5VKsBmLgfAH7JO9Iq
	283D/hHOHzNYICmo8uxHV+OWeFA84xancXge0Z6I9ClkuFvSbxPGD61fwTsimC5Lrm/wqYxfDur
	vsdxnvGiIfJ5HXjOjEursTdiHvuu6rtE=
X-Gm-Gg: AYBFou2S7qjaper/MxMChDYpNoeR9a3kpeuRDOINvkFBzXBZLTVvM/M48pN++H5YHte
	wQYM6J9rXy9WY8dKWuTg72P+JFYmJZMxlsBLLPVycaRDgouvtrGN5w0q0TtHY8gJPdZcbgnjmdW
	C01Ez4HQUmGX6gKOAC6JHaHaGRee5pw2uxeWancw15Iat6MaWCSF2qHBtIfETLG3mFUh5kwMR2C
	+8EyscU0v43MTk/luvvs7CWAxRWLjYidsyy5LC08A5KDs+KLqBoKRmHeDp8YNGEnhrXy0uDmRWv
	kAheBrQVX8xWUXB5P/rd6r1CUJOmket0Vmy6ASJARxReByTGmrvRVYua
X-Received: by 2002:a05:651c:b27:b0:3a9:9b0b:b789 with SMTP id
 38308e7fff4ca-3a9c4ebac3bmr15900241fa.3.1791692659381; Sat, 10 Oct 2026
 21:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010081059.3096312-1-bsdhenrymartin@gmail.com> <8393a8a2-2ed5-4d63-b937-5d837c1bb1aa@collabora.com>
In-Reply-To: <8393a8a2-2ed5-4d63-b937-5d837c1bb1aa@collabora.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Sun, 11 Oct 2026 12:24:10 +0800
X-Gm-Features: AclHuK-BTl_lG-VGVrLo4m7etjeQVOp6O1v4a1N4RBOkp9wdRCffIEeVjuhsxU0
Message-ID: <CAEnQdOovxVfYAyiEZ8nJM-DXe=r6apYkfmpJJUNx6CJbg61_-w@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: reject mappable HOST3D blobs without
 host-visible memory
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Chia-I Wu <olvaffe@gmail.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Junrui Luo <moonafterrain@outlook.com>, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

You're right, thanks for catching this.  bo->created is set
synchronously in virtio_gpu_cmd_resource_create_blob(), so the
unmap/unref completion chain (cmd_unref_cb -> cleanup_object)
releases everything once the host acks.  The leak I described does
not exist - please drop the patch.

Sorry for the noise.

Regards,
Henry

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 04:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/10/26 11:10, Henry Martin wrote:
> > virtio_gpu_resource_create_blob_ioctl() -> verify_blob() validates
> > blob flags, memory type, context and alignment, but never checks
> > VIRTGPU_BLOB_FLAG_USE_MAPPABLE against vgdev->has_host_visible.
> >
> > For blob_mem =3D=3D VIRTGPU_BLOB_MEM_HOST3D the blob is created via
> > virtio_gpu_vram_create(), and on a device without host-visible
> > memory (plain virtio-gpu-pci,blob=3Don with no hostmem) the failure
> > comes too late: the GEM object has been allocated, a host resource
> > id taken and the create_blob command issued when
> > virtio_gpu_vram_map() returns -EINVAL, and the cleanup calls
> > virtio_gpu_vram_free(), which is a no-op while bo->created is still
> > false (the host response has not been processed yet).  Every such
>
> virtio_gpu_cmd_resource_create_blob() is invoked before
> virtio_gpu_vram_map() in virtio_gpu_vram_create(), hence bo->created is
> always true, how come it's false?
>
> --
> Best regards,
> Dmitry
