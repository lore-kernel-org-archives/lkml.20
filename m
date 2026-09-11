Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6537E5EF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151357; cv=pass; b=ki8qOTfT/soOg3QpdckojqoDuseCshUUg4czl9c/t4+PrVN3dwobrf+Ciw0S29nOIJ9xklJMfGdbP0C7p+EJ58xHWPVBw+TQ9MYdWplxV3EQfTXyY0uFA/i86hIuKaJc1Y+zM1Joq3d1+9RYPDFSojBrSwmVzAJAd8Z9kP3Fw1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151357; c=relaxed/simple;
	bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsm/tDQI4bI1YvOgMEHicb7TIASLqly5roNqeoew7qgmtkQZBHUzWocQ94RE00+4DhFeXn2CXoTi2F4VmtnryZSsaD04MTBYOobqMqhL7VnFTXUERdiJycVVF8yx4oDP/xP/hz5UX5VcfoT1WJYnWXk2zf6ik4tBkRbOLwXO9hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EET1zZxh; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EET1zZxh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so10345135e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151354; cv=none;
        d=google.com; s=arc-20260327;
        b=NZQMa2G3mK6pB7clkelbSwMHsY94ParW1rcN90GbYn0Nx5WM/PeorhPs0M3mRVflW+
         ZP/2+8qofqXW1cLpX2NeLYy1M3G6FdRybC2x5r5B2Waq/jD2KDrjhapiyQAEjJswg+ru
         lIPLoapJd4tk59zT8NnlHOtppXDBDFPM4mMZH+2UZnZ4OtQE70qNACZJkQrn41DdRAwe
         ZHK/ZU1hxABbXdpmsa0fqvwUanAeEQMdJtiy2nU8aQhNgEMlgwmZ8F7eAIqxEtArZAO7
         G2s1zPXA0PUxkaXfUCcGVJQLPsVZFnpwWt0FxYtfAKa6x+AYBg/I53y0mci45kn6teLo
         441A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
        fh=dYN+Gu0AB6DSbUijthwdD/jkvKq+YjDIx4edTTsynXE=;
        b=jX/wfrOkcnRcouKHHziqMkvO00fqi1tuBsz1EcMaFQyCsADuv5zUtT9ExT8EnSWbrt
         aUjOmkTPVPdOOVfuLBv0J4XvR6OGEQxPcV/3JilK+pWgw5opx6bAZPTizqr8k3oxwxxN
         kpCfiSybr6gRc7uP2Y2pZo26Iuw3FKD7E+29fA09NY8NkKIsytjD8cpbpUA4LQEYs1Gj
         JA1/ybpaJ10EZqiZT5NeT5lw2TK5u1CXbep/itN56eODXwIr1k9ulloV6kAlYomjFDh2
         kN6rO0EUPukFddDjjDiJD5MK/HvD2Q7jhPxcTwXBMtxsWr9f4zayc9UzFF4TrGQpQWA7
         4mDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151354; x=1789756154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
        b=EET1zZxhcmInoFLGZImpDYoGbOqm6A4K9GVlZZEbMGMHaYQjga1GH9r3gwoUDGE2P4
         ZuQ73LPR+izkLhNWdEkfG57X0G8N0QG6qQPne3yW4bbctsd96xJfc0g0DakQ9fpuK6qG
         rfiUFb8GAkGOjPTPCFSMZKE7Kw+cR0bsOqGCsF3vwZd3mHnFCRlJgRAE+9JbgKAJJvB4
         vuU52tM2GuHgSnSQdUuhHfagcPAz1TSxhoftPkN9kIhyo2nHsxRPXhufzDObzNcL5juW
         6HxGRRw0mr89H7QxAyTp1Ev/j6hwV6x9AlzrK8+PMVvKqlkFplX8QltSwjSZysTGHiuR
         1pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151354; x=1789756154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
        b=IBeC7/BZZYWaIxZ8pSDDJty3Ua5UdWCma+GywMd2WQ9OGRNieCBWXgwKm/0lTLGMYa
         LBXT3vciFXzSujGnoR7pv/GrTxWacs3pyGvfHxjjgH/cFtZ33nUWxZxSVeX9NZ51+EzB
         SMvIoykZ5SPjNdnp8F2zssVmarR9bw8+PVdnRAO18ROyBfuK8O2KthZhU+UZlLO6DAVR
         cu1f4nHRJA6WKOPPLG8j98cOiYyoSNvQyVjAvwExC++WlteHsw619rDgA6KpCbtkd3bg
         03Dj+j/THXdL6Ae4tXa96iVxjTAkLTsGSnb8Lir8wAeCm5C9j/Vkps177cb7XRVomloX
         CgSA==
X-Forwarded-Encrypted: i=1; AKwUvBxoQLPjOG/sUFLNUVhoZrKaKN5+jbuVQqeVtZYpi+6fDEXUQ+Rn8mrFksMw1A8Tc6xbls+MxBaa92/n6rI=@vger.kernel.org
X-Gm-Message-State: AFuF++nZzW8M/Z2mLQnGi6S8SzQQSnb0vWY66G6F2zjSoNVTlxYXhGkt
	QVKYpZ0DbsuWEjATwJ69fYs1bFkDokMTXroyfbdv6ycjkaxygMHDHNgA/L6kYN8aWmOrDWhsbVA
	aydi+T6QwjZOydiHRk0nnoux5VrDnx6JZm++IfrTW
X-Gm-Gg: AYBFou0Lcz4wyNh4hY8g7HJUgf/3utLA5ELS7HKnZz9nQ20wYR/JbcuNrjpzG/SPIcL
	8yb8paOHsvmmHx6Q4afAsxbEw6CicCkpmS6iCnmzb2oNChbd2RB9D0Y+jtalOlDvtMUgeCDuqec
	hP4NReNX36sys0HDOfQS+w0mWELcGnvCCMSpgBkGMKzxbSuMw+8SOIjOKcAiUsyXYTLPnFSVNNj
	ySA+PqSX85R+xJBT4ps7xn33hMvXIFbG5Qmb5UDd4otyOOVkmLD7p/kc+9IL77L3wzoqyfCsWuu
	C0ECQzJ94Q/vnd4q6uxB+GqHZN/LuNrNpWn7IVAersuoRV2Td+EgRb0IBHEaZ+C0z83N8C+WKHX
	/UetxZ7fu5g==
X-Received: by 2002:a05:600c:1c10:b0:49c:fc6c:be05 with SMTP id
 5b1f17b1804b1-49e619f7187mr75881355e9.28.1789151353638; Fri, 11 Sep 2026
 11:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910233553.3477055-1-jthies@google.com> <aqQCzNp9e6JfozyO@black.igk.intel.com>
In-Reply-To: <aqQCzNp9e6JfozyO@black.igk.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Fri, 11 Sep 2026 11:29:01 -0700
X-Gm-Features: AcwNN1UmvAfXnMC2eFhkRALhuyKuEqgO9X_kgve427KCOZq2yvHQpgc8_cZnO00
Message-ID: <CAMFSARc9XQ0BDADK0hV72GJrjee7OV1=wo2mVsZipoa4F46Diw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Cleanup UCSI DisplayPort OOB fix
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 6:32=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:

> I don't think this is necessary.

Hi Heikki, thanks for taking a look. Mentioned on the original thread,
I'll send a fixup patch to make these changes.
