Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0C32B13E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845069; cv=pass; b=AEoF6r2oD0XsfHs7wDLnAis6gzBfFqb7ev8itHqRVIj0iO6I3nO3N+YqGMJ9EVnAw3Tf34pE78F/2fKHwA3Mn4L3isnUrqfN4err+2Nu8XTE2DU9tXig8MY/1h7JRcqsy2LS8kdVr868gGklyduhn59x6ZQrmz3bQTTTXnCo9qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845069; c=relaxed/simple;
	bh=v4xQIeOd5BKT9J38i/WMv3K57/9eNbzDLCno8SBPAO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+2ivCOV4IysZkR6/263YyZljGHM1pWxuBGNiCsUnDe283VUznCc2eYwt1eJ24AAqKVGaEcGb1dps8ps/gdOlcw/5qyzcjKsw/f2azOCPa4yXCDs/r5MQLCyy4eJTBVYU0+ngp+UnHjprJynNu16eLKXk8te73ZNbaQVOjADe4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfLrc8Jf; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfLrc8Jf"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso2819417a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789845066; cv=none;
        d=google.com; s=arc-20260327;
        b=C4tC7DbIySKeb9eI0SNATrJYCU56Npnto7/9pdTieSpSC/XngxKAqvccZEm9RF6ES/
         C3EZkxtR6a+5BWu2THpGhBZpV3O5N/kddn6BcytW7Go3umd6/0OjPvu0KuMkd9cf/g79
         tiFc8sY1v0EN4GkHrcH5ECarKmYUGnU+KGFu4HlSrFy9iVLBFVNvpxDW56znBjUPK1kf
         TzW22j8jvG/MjlrPdCCzc12bWiGe+Wp6opEmMVLis7Q6rK/5sA1NQfr3uSpZFq+ZBc35
         4Mx5bS9TGfPkEp9L7/IMPZue0GHaXxvSAOQFSQi5jbvFEVKipisfZ2aQkm++arc3MWV6
         Sy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LLCEhWQzt+Jsb6k9Ld83aaf5FvLTdmT7qnYRMWkDfM=;
        fh=4v1JnL4cssup+MaypTyEcoNMOsQ912F06VKCZL2Ds6I=;
        b=Pt2NZq4SgT3piHBU+1ynjruw0Zg2axNYYvDkpYwXwkBUEAD6TfHKoQY2mGGOexRpaK
         YtLnjtcI0QBDdchU+KlVWl0MR+7VCMD+lAjCyoiLsIeJC2asBZ+HbSMBEvhZC36MIMKa
         /+vWJD+k+OOGuxEqwLTFP4jkaSXBGaf83n7g6ViHyq9JK49bkbvR+I6T0noJ0HdiFvum
         3n+gOae11ZalqxXmO2RG/HLiUR3gZjfZ77K0jgLvp+kItFAlFFkn2BOFaDbH81qs+/bJ
         FZ1JINTsSsSAYF1HYFNi4aPWxhuHcyTubVYraxvw/BmRp0LzwQ5f7TiGq3H93hrrRNt2
         PDbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845066; x=1790449866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LLCEhWQzt+Jsb6k9Ld83aaf5FvLTdmT7qnYRMWkDfM=;
        b=mfLrc8Jfx98OudiL0ETS7JI5VmUwVzv6oZ4y8J+i2pvl+MZCf+4TCmxQ8NQhCTGSIn
         5f4zAm2+JL8AaUMSvjHCiaWPz7kUCrgzGeOFh7DTdAXFKlZhA+kECFnfR1y1cOMhCura
         XAgPB9j8HJVAgq0S3QbfT6ywZwREzokWcQzjVOLxThm1fZEBFcsICeCxo9GGGy1ymner
         /n5E3bBcal1dp8Qd6tJLTcBNQtDeGiHFkVzWnRy5SA9So/srfOQWeJg8WENzbmmt6e2q
         v8VbH3hNZDG9OhGL5MiNAxv4KnlikliV+9+2V4f8xIJH8Xe4S2Su4Mdf7fq8GwdzOnBO
         9WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845066; x=1790449866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LLCEhWQzt+Jsb6k9Ld83aaf5FvLTdmT7qnYRMWkDfM=;
        b=jR0oluigsL8N5Z/pVeRVFCqQqLjHOPmoCvSaUGf/rHZZuxcT5vua7V7mMm6k0DejDL
         6ZXRWmx+QIXtGuTwdIOTxwl0XipDEUR9Iaszx/IiW7amBSDks6MeQQWgseQd3fjZicA7
         13MQ6jpFaEoTWwUs5ReQ/Bx34yEaZAnoBZTbizzDUSrvcop8ggW5Z/HaviNwW2pgL3k7
         d6f6vO5Rju2Qi3Cyd2TZibSU6wkMp7JG35QgIa15tKo3qx89J0jBhaqL+hO+fehDVAFh
         X7q0ZCqQiIfT8QRbPXHwD1HnB7x4D7NiR/eDCR62znPLaY90THW6sJ9Ay1X+4cISiRnu
         DCkg==
X-Forwarded-Encrypted: i=1; AKwUvBxagpdvCqO/0wb0wrQDHm2M96z7Xy8lK8vKDYnzwhVP/TApNRkfQ92EuI6BTUiLQ+fYQ3oquaVWPEDm2qk=@vger.kernel.org
X-Gm-Message-State: AFuF++k0rY8x9+5l7jHObTsJHVVhLm0kZUpwVvtosxb2N3l2EBV57q2H
	te/Gu9e5QRFrfbbJ9vtVKA1cqTGH1ikC0sJlrWEawmibeoFavfzEk5KG0prvQiTDx6NP0Q8Mh3B
	R31Ic35iNTXLBZlCJzZpFJBhV5Ym+ckTWENOUdAY=
X-Gm-Gg: AYBFou3Kr6D7BGcWHP9CjDP6b8wqPdtQ0XHM+KcIMfGmNTh8wojsIg5xS67pIvsYwcg
	Q7pFH39d5KHNj4fGvY1pett4w0To4fLJSpMiUg+m3Mkg1pw55bOSJrKVifX3JE9lGRlQ6MPCPpJ
	AiY8WdQBiP+Z9nicYdYI3g45/O2BeO4Xk7hohn4br+whHY8BMiC2ky4pA79p+/ABaVVylNb9/Yb
	cFNw5VPt2xgLTXpJe/gV8UEWnmtH5sGCQfzOapa3hQbWDkbU/6+hfH6lGEyZk4FQyRLu9DyMRM0
	4LsVO7uCp0T3lZ5R6vb8vZUTqB2Qas2secMWBsuRtTxtnvrLLFhfakAsL7JzL93qhxPFJXVZ
X-Received: by 2002:a05:6402:3819:b0:6a9:b203:f410 with SMTP id
 4fb4d7f45d1cf-6aa5686e2a6mr4942408a12.21.1789845066121; Sat, 19 Sep 2026
 12:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907074308.109603-1-ayush37735@gmail.com> <CAPgWTUSK8B5hk1+TXEkxhxX2WH8p67gE9-z2MLGc-xqdWzKnHQ@mail.gmail.com>
In-Reply-To: <CAPgWTUSK8B5hk1+TXEkxhxX2WH8p67gE9-z2MLGc-xqdWzKnHQ@mail.gmail.com>
From: Ayush Yaduvanshi <ayush37735@gmail.com>
Date: Sun, 20 Sep 2026 00:40:29 +0530
X-Gm-Features: AcwNN1WSH6gP9mfLlIpVpWYhi0RDSUyRuAlpJmo0mGf6EOYqlbeRzhfuSndIlEg
Message-ID: <CAPgWTUSjN6DJzJDWVGt34XmTc4S01PWNo_8Nd6QoV2=-PRVHvg@mail.gmail.com>
Subject: Re: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
To: michal.pecio@gmail.com
Cc: thomas@winischhofer.net, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Just a quick follow-up on v2.

Syzbot tested the exact v2 patch with the reported reproducer and reported =
that
the reproducer did not trigger the reported hang.

Please let me know if any further changes or testing are needed.

Thanks,
Ayush Yaduvanshi

On Sun, Sep 20, 2026 at 12:00=E2=80=AFAM Ayush Yaduvanshi <ayush37735@gmail=
.com> wrote:
>
> Hi Michal,
>
> Just a quick follow-up on v2.
>
> Syzbot tested the exact v2 patch with the reported reproducer and reporte=
d that
> the reproducer did not trigger the reported hang.
>
> Please let me know if any further changes or testing are needed.
>
> Thanks,
> Ayush Yaduvanshi
>
> On Mon, Sep 7, 2026 at 1:13=E2=80=AFPM Ayush Yaduvanshi <ayush37735@gmail=
.com> wrote:
>>
>> The USB core holds minor_rwsem while invoking a USB character
>> device's open callback. Avoid retrying graphics-device initialization
>> from open() and fail probe when early initialization fails.
>>
>> Also stop sisusb_do_init_gfxdevice() after the first failed request.
>> Continuing initialization after a failed USB request causes additional
>> synchronous transfers and their retries against an unresponsive device.
>>
>> v2:
>> Stop sisusb_do_init_gfxdevice() after the first failed USB request and
>> treat early initialization failure in probe() as a probe failure.
>> Remove the initialization retry from sisusb_open().
>>
>> The exact v2 patch was tested by syzbot using the reported reproducer,
>> and the reproducer did not trigger the reported hang.
>>
>> Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3D3bc656a9271e7c8a5c6b
>> Tested-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
>> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
>> ---
>> Thanks for the review.
>>
>> v2:
>> - Stop sisusb_do_init_gfxdevice() after the first failed USB request
>>   instead of continuing with further synchronous requests and their
>>   timeout/retry cost on an unresponsive device.
>> - Treat failure of the early graphics-device initialization in probe()
>>   as a probe failure, so a device which failed initialization is not
>>   left for a later initialization attempt from open().
>> - Remove the graphics-device initialization retry from sisusb_open().
>> - The exact v2 patch was tested by syzbot using the reported reproducer;
>>   syzbot reports that the reproducer did not trigger the reported hang.
>>
>>  drivers/usb/misc/sisusbvga/sisusbvga.c | 133 +++++++++++++++++--------
>>  1 file changed, 89 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/s=
isusbvga/sisusbvga.c
>> index 3e75a7c24828..e0b1111c1f53 100644
>> --- a/drivers/usb/misc/sisusbvga/sisusbvga.c
>> +++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
>> @@ -2075,66 +2075,114 @@ static int sisusb_do_init_gfxdevice(struct sisu=
sb_usb_data *sisusb)
>>         packet.address =3D 0x00000324;
>>         packet.data    =3D 0x00000004;
>>         ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x001f;
>>         packet.address =3D 0x00000364;
>>         packet.data    =3D 0x00000004;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x001f;
>>         packet.address =3D 0x00000384;
>>         packet.data    =3D 0x00000004;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x001f;
>>         packet.address =3D 0x00000100;
>>         packet.data    =3D 0x00000700;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x000f;
>>         packet.address =3D 0x00000004;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
>> +       if (ret)
>> +               return ret;
>> +
>>         packet.data |=3D 0x17;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Init BAR 0 (VRAM) */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 &=3D 0x0f;
>>         tmp32 |=3D SISUSB_PCI_MEMBASE;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x10, tmp32);
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x10, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Init BAR 1 (MMIO) */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 &=3D 0x0f;
>>         tmp32 |=3D SISUSB_PCI_MMIOBASE;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x14, tmp32);
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x14, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Init BAR 2 (i/o ports) */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 &=3D 0x0f;
>>         tmp32 |=3D SISUSB_PCI_IOPORTBASE;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x18, tmp32);
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x18, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Enable memory and i/o access */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x04, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x04, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 |=3D 0x3;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x04, tmp32);
>> -
>> -       if (ret =3D=3D 0) {
>> -               /* Some further magic */
>> -               packet.header  =3D 0x001f;
>> -               packet.address =3D 0x00000050;
>> -               packet.data    =3D 0x000000ff;
>> -               ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, =
0);
>> -       }
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x04, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>> -       return ret;
>> +       /* Some further magic */
>> +       packet.header  =3D 0x001f;
>> +       packet.address =3D 0x00000050;
>> +       packet.data    =3D 0x000000ff;
>> +
>> +       return sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>>  }
>>
>>  /* Initialize the graphics device (return 0 on success)
>> @@ -2223,20 +2271,10 @@ static int sisusb_open(struct inode *inode, stru=
ct file *file)
>>         }
>>
>>         if (!sisusb->devinit) {
>> -               if (sisusb->sisusb_dev->speed =3D=3D USB_SPEED_HIGH ||
>> -                               sisusb->sisusb_dev->speed >=3D USB_SPEED=
_SUPER) {
>> -                       if (sisusb_init_gfxdevice(sisusb, 0)) {
>> -                               mutex_unlock(&sisusb->lock);
>> -                               dev_err(&sisusb->sisusb_dev->dev,
>> -                                               "Failed to initialize de=
vice\n");
>> -                               return -EIO;
>> -                       }
>> -               } else {
>> -                       mutex_unlock(&sisusb->lock);
>> -                       dev_err(&sisusb->sisusb_dev->dev,
>> -                                       "Device not attached to USB 2.0 =
hub\n");
>> -                       return -EIO;
>> -               }
>> +               mutex_unlock(&sisusb->lock);
>> +               dev_err(&sisusb->sisusb_dev->dev,
>> +                       "Device not initialized\n");
>> +               return -EIO;
>>         }
>>
>>         /* Increment usage count for our sisusb */
>> @@ -2880,9 +2918,16 @@ static int sisusb_probe(struct usb_interface *int=
f,
>>
>>         if (dev->speed =3D=3D USB_SPEED_HIGH || dev->speed >=3D USB_SPEE=
D_SUPER) {
>>                 int initscreen =3D 1;
>> -               if (sisusb_init_gfxdevice(sisusb, initscreen))
>> +
>> +               if (sisusb_init_gfxdevice(sisusb, initscreen)) {
>>                         dev_err(&sisusb->sisusb_dev->dev,
>> -                                       "Failed to early initialize devi=
ce\n");
>> +                               "Failed to early initialize device\n");
>> +                       sisusb->present =3D 0;
>> +                       usb_set_intfdata(intf, NULL);
>> +                       usb_put_dev(sisusb->sisusb_dev);
>> +                       retval =3D -EIO;
>> +                       goto error_4;
>> +               }
>>
>>         } else
>>                 dev_info(&sisusb->sisusb_dev->dev,
>> --
>> 2.53.0
>>
