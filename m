Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222118;
	b=QF1v1UlsDfW5HTZGX1sCj5Vb/YepZLbiiX0SNe6VwYHNjTkUhSeEfJtOpq3y0ibPumwr
	 TsXmCJ93bvqgmmB4kaaSquvy7oaIsHSn42NaUADD8hJ4scbjhoSWZNQmA9NxDnU26x1B7
	 s88IJ4vailsdmuyDTUi7drSW9OEzsAa0vs7uoMX9QGXIUH/dkszqoUCoC5yMJZZVqi3bP
	 Uxmj0sGgHErjIGOomVOy/aT8YbekBz44DJd7rPYYOAE92HF438udRSuby9CcPezonqoY0
	 J2rR7ea0rZqDdwR3HV/YRusjjNLI0NkwGizvH1ggWNEZoWdIMDnUFBBzScYMJGjFv3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
	b=JkGNGvLa3lb3016VRVefie5IPrbJpLDBgIsOV8vLC1ADocWrJWh1YagkCd9zswr12t+2
	 aV+ItZyruL0Q58pug60o/hAq80aBwQMQA5Lg+oV6EbT57QNd62pB5waXUPmB6Dbuhr7FA
	 +K7ashuuqf9xZDvs7zvukPs5RHEjyAb74qWh1bUEpHrgDrtno6/A7M7J+WdvrUScn3LAB
	 P9z16sFghmHpkLh1wiMqVdWEHm+/d25WKIK3vF4em8vTdZB0UV4Zl9GFI9hFRVg6Mv0tG
	 IUXLyW8JXnqwug4pARsV8+7WROxlO04WSmOXRwwKQr23KhcF6syLobD6Gu9GBvxvxKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz0aakdO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F00606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz0aakdO
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso636478b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222117; cv=none;
        d=google.com; s=arc-20260327;
        b=sdptSUDY4aLq4Wgi+OqPOuwPubvY6KfuH3JVSEgIabtu6lndKg0k6EuYPfcL8PAeOM
         3C9H0la769z5wnnWjgcIF7vnkalV1YEF9B1qJao5Hh1lvTxnM0FEAR8L6HNPu9RjmHgC
         LWZOtfMbXlFd6X72/rJtTsLk4Uz+Wu0yGUEC/ap0hPbZw8FWhxNgtAs4X4r6nSwk4CbL
         vT87Kw8Of/bCqWiVe+j3h/4xVBx5Ig5uSvkSaGCMdD51J2Ra3h6LKkujBR/DckDSyR7/
         rKGJxtbcDt9n+1gXHPucP64L94CDxSyF6P6jNowfHEor2y0zN/lMtgFf45gUEBXDG5tj
         nPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        fh=JHYyVgXp5j6jXUUz754WM+bf16Skj0dX/vyMmXDpEj0=;
        b=IJSGZg++AKZ5h/ABp0Y6PZCXYBuZgJeDwYrWS388XaEGPVKoX+U5pDJTgOuJfJVZ/I
         x1XIllRdBboYZ3dpSgcjki8EKCIHqUfZf+devgYvyU3v7h/RLzKdSEEeOO7/Jl9UwV00
         REK6sfcwPP1CvTNZXMrpWBmsaYthfeoO8oJKUkNoRHHghWUoiGPM6vd/I3i8j3Z7sIFt
         85CIpBYOfPxUWv5wWxF9ghJxhrvwJT/rOF5OtmsRbLm+wX2V+CK8j9DLdM94novi4KVb
         Frt3v3RpQ6dzDN7MS60bspvWR17ADdGyceseWAwfclv8RVGiflnvTZBQG33EksliLspk
         Vf9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222117; x=1794826917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=Qz0aakdOjLfz4kVdVmKCIVf3uozBAYOxMMfTdisyhalGjGpAUbIE5nIDFlTaneqlQa
         JnyRSEBugy+xfC1TYsOhfPVBxgON4rte2A69iGCEWmrd3k6dUbCpHMJr66o+9kwqPHGy
         fJzTLeOw3BRnqaEWozIgxOYxkS/naax96d3bteA4lZ3aOVUTkeKKt2zVY8+Btpl+ulhT
         UzismSBemMwcnru7vTkmp1bf+KnjcGfw/8HpaZtGjHtvShnA6UwwiR2gBG/3AtyGMUeG
         KArnIjEulOj/BboUkGMtkfY/lyXsPrRvsjRpkIFZmctJcPoQAck0ZCcMDIFzJD8Yp9Wb
         5nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222117; x=1794826917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=Oj29WnjAVMYBoCwoviHi11LRoouCtP77aEvVID/rgWqV3J5/7SqLDy3crcn1o9CG5m
         e2brWDve7BXxPTrWX9vTNgDF5/4pyDd3X4IZZ4fi3egx1iq4BhrkdGj3K8yGOJdZmT/E
         oTkVOfcOkzAzmKDJ02/XO22oCrOzRrSvFAjaOl3fun37271OY0wvIxq7YOcwUnTwMgoN
         KhEP/0vvjX7QYK9dVHcV4ihTnBXNZmERtJoKcgyHMfle/KjJa7h5KiJ+7Ff8iotYqjb2
         d7ELYIQPAITxknUGlWlXY7wERB0mhuSkI1oi+HoaH7NNboxuNIcgD+lhYDqhjHX9b8A4
         Sl9Q==
X-Forwarded-Encrypted: i=1; AL+hErHvs1CEuZFH1fd8ZNPg9sqJQNAXP3ZL6ujeSULhRZ3BKGAwnUfaxdXRsZuuO8yvMOIudjlT5pY+FpXDufE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K9cJ55brq2T25Nt3oukhFwg+iBmWXS3XoFTEuOKDhIsPIruyw
	Lt2EpHyRf2wdyipI/lVZHuppmKMO5Pf0P5w/3ruVEOlYja6hl2Kv1J/Rhjby6OT5mInGqKk1kRX
	L9ZdeQF/vp1uRdmXM8j1oZVXyiVzopHs=
X-Gm-Gg: AYBFou2IEfgVuTvKuSuKFoCaF5tgQslbkck0yXfNptjf3VitfebkHayXLMrWARoElvG
	UIHnyIkvuROZEdAWRF0l4DOAwGea9XoMpnzrI4y4TVzcUtcce0jhQBte9l5GgE9IFD1MdOrVmoB
	YX9Zwe0zYN1oZjP5VTyXnmMBieCo3+Eg2T7+ahlWNdh+IBcWj7srY1VtyhXpE/yglEe+IAt+Rzu
	uZd6ZHz1v3Zy/cdpkm4hJgL9YXN2J7IU6VHOXFQKi/s9S7AB+LbfVETrAVt7ftqDRUS1LkyEBqP
	BtEjTa04aHMPfBqQ/daWwjCuNY2p3AJD4IKZuivCUKuOlkztwUKaTLo5+rUCcSSxNwKONJDFN7e
	mXP+UveTjHn0wYcsrBzYdfT1YC8mPXiWQSOxPKQ==
X-Received: by 2002:a05:6a00:3c8f:b0:882:d8c4:17c9 with SMTP id
 d2e1a72fcca58-8b66e343903mr3314714b3a.23.1794222116824; Mon, 09 Nov 2026
 03:01:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
 <80990ab6-5072-43a2-b829-177c956080c6@kernel.org> <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
In-Reply-To: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 19:01:45 +0800
X-Gm-Features: AclHuK-vLDzqpNnq7WjP_EKkxW9CPBRL2HdSB_SqKuNRWnq2UdqsNh8iwWDBhD4
Message-ID: <CAA+D8APyfdLR8cvq3GMuF9UdQ5yM6LNSwwuvt+7rYaMFPk1Y8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:40=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 09/11/2026 03:22, Shengjiu Wang wrote:
> > > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com =
wrote:
> > >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>
> > >>> The HiFi4 DSP provides a separate reset control for its debug logic=
.
> > >>> Keep this reset deasserted so that an external debug agent can acce=
ss
> > >>> the DSP and perform debug operations.
> > >>>
> > >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> > >>
> > >> That's ABI break without explanation.
> > >>
> > >
> > > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This ser=
ies
> > > adds the DSP node for the first time, so there should be no existing =
upstream
> > > DT relying on this compatible without the reset properties.
> >
> > That does not change the fact that you break ABI, does it?
> >
>
> Yes, it changes the binding ABI. However, these reset controls are
> required for the
>  i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
> incomplete without
>  them. I will add this explanation to the commit message.
>

I also think it would be better to split the i.MX8ULP reset requirement
into a separate patch. Does that make sense to you?

Best regards
Shengjiu Wang
