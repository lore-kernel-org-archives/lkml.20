Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9763B8D40
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906150; cv=none; b=J0FyjImALq4s5gS8SikYOdtadPwNvL6Ml5h0jINCUCMfdPfj3eDcGE8qN+eD5abRsPtoRgNEBQTJx0aKk620X16PfNK+5FKtrX6lHBWdbmM6+oEglPrH+2VheiS4LiHSTYSBPB2atxOAuIw2KSOqf7q4+UZEl7ngAmAHC9Pge1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906150; c=relaxed/simple;
	bh=dBHzUIUBfsk5+tZfCjA1x9npjd6OXYKBljORHRBuAoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rkgEyoTg6kZid+Hx8KruFI9hz0linxfhyImPQHotsWQ99qCtB8Ml1MvZ/UzVIYq38/m1uSERqvirC6sY06h/GjthD+EUrDAz/OXl3HhVZDe0VAF6oIvxP6/gdSzVqevhaRMmzv8uJkAMG58Lo3zCG/8FCRyD5GxP7u0lrgKvxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owH+zgz7; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owH+zgz7"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so438124e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788906146; x=1789510946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBHzUIUBfsk5+tZfCjA1x9npjd6OXYKBljORHRBuAoY=;
        b=owH+zgz7Mg8jAuv6lAmO1fzd+zXeljxm2ElNWmnYpW+qzAvgiUdP0qWvwa75Vy0TFJ
         nr+V1OySO4fKlx3GbroUNHxDyD+nRcHxNwfmyq/zo2ofjney3juSk9oGjw5ju6TMQdcQ
         BTUPZjPYeLf06tCIc9r07jHZDN4Ms6XumpqGzveauvLdUpfwF+3gsWADVTt5NA+2wyEL
         rnezxvMWEJIaFEhnIV+WsNhkhB7uIHlgGf5/pVLVZeq7yHeWb2jb499WTXIpc5MC0Knl
         i5R9EIrrcuyRaqGiLXfmTSxIYyu9dRfSS3bxJe8eN1OtyMt8g4fexPvdiVmy+lP6esxJ
         qZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906146; x=1789510946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBHzUIUBfsk5+tZfCjA1x9npjd6OXYKBljORHRBuAoY=;
        b=c3J3qAiaGAERljCZS47JJvXNzmrmWk9gKUQkZpOM8wns4CqEF4YLsR+CH3fPgtBSpT
         2M3uA3N3ff/TNKjD2IRepXX7Rvb089dc/jOiJHy7/lb0KBcPMmj/P5zaXSrENM9XceOv
         /bEaq6kwcZHKWuLn+uCrq7/EgkvCLi391z38c+DM7T1G6kj5sZaxFxWcxaJSKGdz65yO
         Kcl2gKaJHZN/iP7jsBjsI3PN7UVDHriGWLnF4vpsSh9fOieyoWhfP2jCtUD+kFmj1QVb
         ioq6gA7zsS75X87BRdO0YmSFvoB4H8XmngONAvCjhrqyp6XRphwsoLTOr9wvPiLgZZs8
         7qpw==
X-Forwarded-Encrypted: i=1; AKwUvByZTpYIhNJy0B6CFMecsK+QOmyRiElk62qtbYDsE6ZTKlNHjTOrJQQOCuxVoGsfrdnZMxJbbQK6EfezxYA=@vger.kernel.org
X-Gm-Message-State: AFuF++kfxvqXWTeRhYl3h3VX67E+bPdM/SwqJEKQxRUtBtgR/w8l6x+c
	teJ2mX8e/cisE4PrYrsX2K5jgpDMVhNbctBm7jQW8f0+tZGj0DXxk/l/
X-Gm-Gg: AYBFou3liahgSvawK3AJ4tkMF9LRo9Q6EUiOYOM9jOC9Q8ocEeVEiIGqHdR1+gSLwzU
	0oy84S3ruJzzyijiryottqnfITQpYaGjM4hMureLjlBHxVQfBLVH+tad4Y15T2F6St1HMU6geSH
	Z6KwaQvu9KwLZhpiVY8e5y4AdYVpoOwfsoqqdIzY+LREPOxik3ig/n+v8XDIU1p6alUHtjAAF7v
	RfQhdkMd4mGqhVzaF/LjQOFgeoFMRwDgOEa2M6n4Lbaa8GcemcqYolxu8Um6rxxdKMlfeZuHttO
	w+42YvL108N0iEJ39WWd/MEEFoEYzDOpwOzI1X1JbZ4FQIQdIBGluYCaMYrvPa9VOU4Y0qMeZAf
	WZXbNHXkc/smz/JgA+UO2+BW/jey4/f72FFYB6xgiz24fsW/F01QNjoZ557KH3bsPrSgo07auPY
	QWFIuH+17jiaHkWKQapY1jJligiuGq/D1BWpWwodu2kn0YvQNg36LwKoQmVV7eFIgF4zM/9qhuE
	iSQZPhNMXShIov6e7E=
X-Received: by 2002:a05:6512:1321:b0:5b6:422:a61b with SMTP id 2adb3069b0e04-5b763cf3f3dmr657559e87.27.1788906146292;
        Tue, 08 Sep 2026 15:22:26 -0700 (PDT)
Received: from 127.0.0.1 ([94.41.86.134])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74d55a4absm2792656e87.50.2026.09.08.15.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:22:25 -0700 (PDT)
Sender: <irecca.kun@gmail.com>
Message-ID: <378f8289-a32b-4b60-9f5f-dd9f3940b0a2@gmail.com>
Date: Tue, 8 Sep 2026 22:22:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: commit 108cc873398932af589c295f78c348513b8d70d9 breaks
 update-grub on btrfs root filesystem
To: Alex Romosan <aromosan@gmail.com>, linux-kernel@vger.kernel.org,
 linux-btrfs <linux-btrfs@vger.kernel.org>
References: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
Content-Language: en-US
From: Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>
In-Reply-To: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Running my own compiled kernel without initramfs

> a git-bisect identified commit
> 108cc873398932af589c295f78c348513b8d70d9 as being the culprit.
Looks like another consequence of the problem described in
https://lore.kernel.org/linux-btrfs/dfbe1e27-dab8-4d55-8cf3-0b28eeac5df4@gmail.com/

