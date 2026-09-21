Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF5349CFC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026265; cv=pass; b=bL8mQ8MBtz50SIObDbtUgbHgvc6jdXFzVx/OglZ7WX9INhWBEdNUxcYZdM6Sq+dVH2RSMpEpUuiuQSZWLY+afUlMuqdbEFNYMxQnw7hQrFxZuFHTzuzS6bX/b9uuXvwaFSCajby5vnVP8iNrjXXL9IVEait9psimnB+lLK63vKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026265; c=relaxed/simple;
	bh=tP2StjssledBwPOyJvu8YRc7oJxEqM351GWXVfVRDlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJSVsAgme1v0VYEKUwnmi3y5GUdHlAn/ge5pP7zzOvz2qd7Ates6dtQ58SVleRWNDOZVtXIlsakBzADuIQRLaaC2ZEDkz6drFWg/sPEcE+Tc0JHvdhSI7LLroG+NsQmQADKwEUelRhrfe/qqIlO/c8ssJ+r81v+K/6dt27BopVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSAREjXz; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSAREjXz"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so16139a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790026264; cv=none;
        d=google.com; s=arc-20260327;
        b=b11EScfeG45+A038XxfcvudNylSTZBfzrkCBInfdF/30oTO5Qm/zxXDNPh2N5IilSW
         F/9PPXtoHXrltKx9T2N8GJcC5c5NaUiP58VrqXVI93qarVLBGSIs+ZnD/3pl3VxCR/Bu
         VuFam+MUpB5ZNB5iQRK3cQq/uLFEcXZ5NWWDESiyXDgD7xLGve5OhXpORp4set1/U5r2
         kdvSxhiVGor1uCVcFNDqbIs53aHF66KDTZXWUKjqcdRqfPSSYHRu47wzYGI/BCx4YH5K
         P4eS0zwh6V63k7/gnhHKDJKg6vUmdCiXTb+32qi5NJTQNfwU6MpqsSkqiYs0jMf19tgB
         wvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npM8Tm5310J5ykZ+cQxb8lDmWPmckdFtiw8vnwk947g=;
        fh=hKbGe2i0i9ZQ4Napk+mzg6Z67NouekoDTM8nGJFu5+o=;
        b=gcQoVhG/+aQl4g9RQYYBonulkltUa9kTQVkMtl/ChVsKGZE6V/dSkDMPhYCQFKslzk
         Ihu+/goFmmFGzRARxOIK0rntN4skW5OhTWQ2f3Jw8jdrt9sg5qvach4xG+IGHTSpCgES
         PW6aT1vwKKGoHomAIxSEf2sscVfgHF5GNRfYIeQSfZrNIkJTuJobscLR/QVaRb2Cu1fT
         liYl/T35khNST+2rR+WBX+D1DrQQaT8kviaikadc9sBcyom4yb+ytI+G5U+WY6+hfRHA
         aWSSzKS4MUo4XzWuPsqTuzXMCQprW8VaCOZXg2AWanMfx6hfgKQIBpE5TbUJfIjmHWgS
         sQiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026264; x=1790631064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=npM8Tm5310J5ykZ+cQxb8lDmWPmckdFtiw8vnwk947g=;
        b=VSAREjXz+sgUHGpF+pVYaWyRns4dYvNq8PG4bYks7MRZ6u/6QvH8MAaBpsKEUjxxKG
         F1MpHVggC5incmcBjNVk+VAs+ANsb4B1G+11KkJIl+ZQcdt3HDu2r1X5cH8O0aOCgYB/
         D9+BynBywKh8vHfEt2uCpAna7+26jOq55bAQ5ga1M4aLS9rxChrpM8r9QjbLe+PeZ4iF
         Zcsjdox0kwqw/q6cRMiqOOPq3ADj1KzqWAZ05ARFOtlD1yaY20M9r2FJRChVAobI/9Lj
         HJlkIPZr+w1vkejE4ntQgC9vS+8KWjxE+NWo4kjnNzCCSE1xJoaU8SbrNxEZrXQrnszG
         wFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026264; x=1790631064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npM8Tm5310J5ykZ+cQxb8lDmWPmckdFtiw8vnwk947g=;
        b=Uo54c5eTJgDz3g5sm7zg6PmsPlM+3vbD0qaP2keEWGHsR814nt1rN7HpbbEjg7fvBs
         0wNu5mAhB94BAB6CjfzlGQuTFHU4j/7cuVpnZZDpO8Y8UDHBwXnnACmUg5bZPI1cQPVw
         n77n5noCjFuEAEwKiKvtHiXG3qozQq+qqHVAFtV7k3Z0R39CoRj+7VfRq1Lqx4ErNmCO
         FKPd9N5uUn6IDuF2bkR71e6qRUrS5BNzBGxCFuU8PScHkRct2USUQqu5JFbM9L8RKbqQ
         kybUGNO4jEbTqmzCA9pVDv9Egvbh96jtg8CGPRaEgmR1lHTR5CF2fhhTMghS3yIeuC/9
         iElw==
X-Forwarded-Encrypted: i=1; AKwUvByCRa1uAETOZ03/n+rVRsZjtdj6HDhPBuJNHi7Vf8YsGhY134Ottr+zg+MhNEF7CiV3AYjc7tc5vwmB0ww=@vger.kernel.org
X-Gm-Message-State: AFuF++mvdhRuCeH2zQ4maetP2It+5+IH8dW+DEhIEfAw1/zcHxoKOAbI
	a0geRkLEQPLEZOv7kXyWaTkGZo9sQbr+JoJ5mXpa95ReU2DAuYg3pjTUmF+cU8RFTkCOMXngLBO
	SE1dwoXZv4SDgFfltBKJlbkGPxBfi5AU=
X-Gm-Gg: AYBFou1bF5Hq3tIYox7DrAnSIrzCxVP0Mrf6gJfJv0jYHBSN5akPwSsNH9ZytQK5pV9
	vxaLc42fBcFKJUChhYCVP8VeJPQBh1OE62hRdZar5DspsUEy9ZC+AB01l3In+00ajHtWN/+Sj+N
	DRC0MUx/fyAR5vdYsXKInDj2j/AmyU7XMuwqFU8cDvMMlVBdXkc7cyXqlTJcwD9Jcf5Gxm4WeV+
	ZW7D+QhB/VIN8Uxyrl72sx81F6VIgWBgC3mVG2jEs9RbDIWKj+wnc7vfNExtXwxgGMfU62TrkRk
	EO8oYjxXvvg9Xa4oQ2BF23jh2nvbb0XScZD+VZZRXIy5Gs7VKkqDx6R3WrWa8xdf6m8uxw1Dsmw
	KyEwgKfX1Wj7MvRI22/jIkJFhGvlmO6+gqpIOM55WtGg=
X-Received: by 2002:a17:90b:58f0:b0:39e:261:4e13 with SMTP id
 98e67ed59e1d1-39e54f42eefmr24972615a91.3.1790026263555; Mon, 21 Sep 2026
 14:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920062510.166584-1-yaolu@kylinos.cn>
In-Reply-To: <20260920062510.166584-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2026 17:30:50 -0400
X-Gm-Features: AcwNN1WjjOBi88To3FSq581QqCOsezWgyru8to2rFEhGCyGgtBQdu6CsObQOUn4
Message-ID: <CADnq5_M19JOb6kSwUi6juWWSpMtQZtWazw5VtP7rhr5ZvC0-iA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: drop KFD_QUEUE_TYPE_DIQ note
To: yaolu@kylinos.cn
Cc: lingshan.zhu@amd.com, Felix.Kuehling@amd.com, alexander.deucher@amd.com, 
	christian.koenig@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Sun, Sep 20, 2026 at 2:25=E2=80=AFAM <yaolu@kylinos.cn> wrote:
>
> From: Lu Yao <yaolu@kylinos.cn>
>
> Commit e1b73b64271d ("amdkfd: remove DIQ support") removed the
> KFD_QUEUE_TYPE_DIQ enumerator from enum kfd_queue_type but left its
> description behind in the note block.
>
> Fixes: e1b73b64271d ("amdkfd: remove DIQ support")
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index d8631847f0eb..2847a5ec5ede 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -430,8 +430,6 @@ enum kfd_unmap_queues_filter {
>   *
>   * @KFD_QUEUE_TYPE_HIQ: HIQ queue type.
>   *
> - * @KFD_QUEUE_TYPE_DIQ: DIQ queue type.
> - *
>   * @KFD_QUEUE_TYPE_SDMA_XGMI: Special SDMA queue for XGMI interface.
>   *
>   * @KFD_QUEUE_TYPE_SDMA_BY_ENG_ID:  SDMA user mode queue with target SDM=
A engine ID.
> --
> 2.25.1
>
