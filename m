Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29E4B0487
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785161; cv=pass; b=CjF2eMYL634AONrrvuGNW8tFX/kO+Hjl8OHHVAvpjlpxhEEDESu4Nail8YJVAYaP7PRIlB1PCffoP4vgW7+pK3cruVLf4r0PtoLALlim/ZqatQ9c2+3Qb3RnFJw7u8ILxrjgrAVVVNZ6iXH+4pfTynD5ef31+2tJqlTIJtzUpSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785161; c=relaxed/simple;
	bh=ld9F1MuFM8EQjs5jwu4m3yxllZhNu6K4gPOmrDmzEow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgjpYYS3WkZyY1lpP1XvvSQXMIPzaEOvgY2hqyyPkFwf3ML6c+0OxCMFfjk0gkrjvIhGAUL1DL4fY6nkVB42xZpAOD37lnbNjfZGnuOXQ2oLRSHxUUr0Lnjo1ibpoftO6T62XytBuzQSlmXkBBeMgnWhl/nQtg+Kdk7K8l4seMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=QG2XsPq8; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QG2XsPq8"
ARC-Seal: i=1; a=rsa-sha256; t=1788785134; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Byw0RjKExjDlAnOVx/0l1IK+Tuc8neSrE7dVvp65r1Uwxkl1TENCu5/VzF9Tgr8rQhenrAZNwrJ2nt6bp5x4Kope3XE3sTz/MONsluYsZcEd7UjelRdghGQak30IaSEXieEQCNCAqYHkGeUvq60szEaRoOmbxLgBC7wtGdLHUK0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788785134; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0/DOGeFLTfp20f1r1ZJfUNZKV1HIwj/2CZETtMTXdgo=; 
	b=Pcl08sQYxpmbPdGm9DD3FcFbFMaZUxo/txrNEm/BO+sQgBOP63Y8Y881dqMroVJEXlJmWpF8wTzIbJGAzyzbgrRppZIFkuXvEVI+ICCgym8BU2B/XZA+zfiJAo9+EAhIfXofzcp1M+2tSXWzMU7vR+c07B4f6sN1fRdS20qCTeg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788785134;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0/DOGeFLTfp20f1r1ZJfUNZKV1HIwj/2CZETtMTXdgo=;
	b=QG2XsPq8+lms9fWw4OfsvZ3AxdAUUbKqTc5kh3UEtOo9qDqrPub8K7qoNbt0nk4A
	me7Cric9maHgksW7IfCpK9bDuBwmZUOM8pJ6OvcgA73PsPmN3iIRIzo16eGvBVE0gvH
	1rE+M88RdTFnOXy7Y0TLH4i7Due76RexMQucX9AA=
Received: by mx.zohomail.com with SMTPS id 1788785132507675.1995630651639;
	Mon, 7 Sep 2026 05:45:32 -0700 (PDT)
Message-ID: <3e8af343-404f-44a1-b97c-efbb206ba051@collabora.com>
Date: Mon, 7 Sep 2026 15:45:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/virtio: Damage clip fixes
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@lists.freedesktop.org
Cc: David Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Christian Hergert <christian@sourceandstack.com>
References: <20260903211914.1109100-1-lyude@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260903211914.1109100-1-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/4/26 00:15, Lyude Paul wrote:
> A previous associate of mine asked if someone would be able to help with
> upstreaming some work that they had done recently for virtio, and I was
> more then happy to help. These fixes help maintain FB damage clips
> between framebuffer changes, which were previously discarded even when
> userspace provided accumulated per-buffer damage.
> 
> Patches apply on top of drm-misc/drm-misc-next.
> 
> Christian Hergert (2):
>   drm/virtio: preserve damage clips for rendered resources
>   drm/virtio: Recalculate ignore_damage_clips on every update
> 
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> 
> base-commit: f9c2f70ee41544717b3c209083073db1e21f919b

Looks okay. Will merge after testing.

-- 
Best regards,
Dmitry
