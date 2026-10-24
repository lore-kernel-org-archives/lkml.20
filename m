Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792860676;
	b=3+YUBhlNHBS2ZJrSXG7t1jQwWB5hzfnvMxHmSbaSptrvpcyicXgwMaS4eyKQTHmImQ8L
	 wPkb5aLkGB/mQfQv+uyKAIKlvjjndVQGNAVYMdggwaaTVd4TQiODcnajRZ/TIsetxJ5Bw
	 Ij1tTgwgpOE9ISggQ2UogaszzFKyBt7fI4qfJHDQDCirL5bL7e8BdvfllzDfcR/8lLRIu
	 5AK1Pe+TwaG8AGK7THwIOt/t5lyqzYNhylLUs0auNlkufzklrSLDE/6y2zbWz3j8diG5H
	 /TFnUI7wdGWd/XIcv3qGXLpJ7YSpj7jRXUEc7jAwvG4XVOs9WIvv+MhEYWbXKUU8i0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yJFuIdCHS3cC2OkE2MBhGwseAsS010zO//GOypRBd5A=;
	b=rK3cCnX6DOKMdO0rCLPU38IHEiZTEi1KUghZXGAl0ZE0b/ox/NSNBAo1+omYWrGExly/
	 3wvjcm19kAFh0vUQtbkvWmbtutwFswVYzYyeELEnT//XcrErfpAFCMNunanHTyHZ74ama
	 rtD3nDgFqYPu7Y+61H/uFsUgjWSNNWdJUX0kQG0WNFiPciVTMwhnHgFNq5O8LJohtX2L+
	 SosPLM34df2SqYqBerr4sggQXx1A/peW5zF94iHUreVAA2BOo6I3kWxCruPLyBzdUHF+c
	 HSNO7ssZYSVu+QT9rgZmbgRATCT7HKUwuXWbhRvOk14y9kMN0ScYrQeKKQ4HkwhZW3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=artiphishell.com;
	spf=pass smtp.mailfrom=artiphishell.com;
	dkim=pass header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=DkVGCW5H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73090606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73090606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=DkVGCW5H
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2026473f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792860675; cv=none;
        d=google.com; s=arc-20260327;
        b=AmnzFwVYzsXohh5yc4HD2PHY+MJ95da+F3FRR1HHdv8HndmtzKPl7j8TtINtHA1gi8
         xhQo+WJXUcgo+C7taWhMiH4kMFoETwkXMTEIq/D+2PT7tuczs3HatLiomRWwZ8BFhNi7
         3HTyQ8400YpUVfrJYgh/MdjOMvmN45dSYkTnGUY0Ctj7wYEJc6OYQqHcblaKo8FROdHp
         3HwjiEvWHIet0R42pKPHtUclsOfVWLCM7FgX6u5Lmc/NVo3AAO/sNQI92hQ0S/qMfLtt
         Jbmdea+UPnNKXLsNZYCfgrCDNiy1oSoxkFB21ujQbhxBzFpb22ZdT+Rn6u/cB9Qv6cVX
         ifzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yJFuIdCHS3cC2OkE2MBhGwseAsS010zO//GOypRBd5A=;
        fh=x6JgUo1aCWIfwcPGV9Whi4hzIDjAvbV+wu/xhGP0T/I=;
        b=lkJ9P3J9Bomzbz1rT+p5KQiWF2apWVeLsijDHPVbPmRqWCXAVKcl5630sdFO5eQ3s5
         QfVIVnEsUcXu7XG1oIzbwEp1Du0kPknKPAZPXUjl6P/faNy4pSjCFSAKx5dUGfNdpyQu
         OW6CCduaXHPfUKGUiFRMWgKO9+wy3UeiVEHBaG3fGTP4qc6fYOA+KuVvdLef2gqxWdrS
         SdradoY1sLpPLC4PeQw975HNg8HeMb3L//xFM5EQB3ZHlN77L/Ww29QjETvm/RMj9TIy
         2joYC6Jf6I6xaXKxqfhB1ocfcAl9LvaxuyBgCu4dv68LnyvQWYtusQEw5c7DNL1C0/35
         RJYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1792860675; x=1793465475; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJFuIdCHS3cC2OkE2MBhGwseAsS010zO//GOypRBd5A=;
        b=DkVGCW5HbfHoxaGtj2Wtyp+bygD2ILvBdVqzDU6QghpYxtwhZIImNbH8crMGli+BiB
         uaSZNAq8TQ6PP6yaUwgtNUrfB4IcWBOdb95cNkqJ+ouMYeJPUoSRtLoBJHDV8I88ANVk
         BjonXsTfqmHrjwLomAe7hw3f+6kurhxNdlwZE7+L1liMT9oSS8uFAzLz4NBK7rli9hea
         DfmnllRBzCJGkqCh5tFQT+Gop9HvwulukyMBEPIEZovIuvmQXwk0c7ArzYtcCPuy43OA
         oHpEHYtRn+U22sNq1/11XKoNnYykX4G8wV3ogwg8BvH0C7Zgq2KvldRP8zjMP2ZIHtRf
         +3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860675; x=1793465475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yJFuIdCHS3cC2OkE2MBhGwseAsS010zO//GOypRBd5A=;
        b=Ih3mTKniVuy3x7ZvQeD+ClHG9aCduRHhXHLQPtmQ1YnJc1HIARTQ7I4otYH25ydp/2
         gWWWEKdIiZ4ipw0pbzcgHXh7f5E8OXQPLNwPJGAbyd7OTOKCWxtYRe49qtjvZ+mx/fvt
         m1fFUX/V11wJPv5O5Ewafh+Mi54mvNId81G8yIYgiqY3ouTT36xvvkg+vp492z2GPl06
         EWy8eLQ1sU0k0N6qwlU15JFFp1ArxpTQvDS8u2U9se8KjVg3UHYv/OVL/6YmxAYegffd
         Cna+Ll1EfyOS/Aq5P9hIx37EQeIClEoNev1oiKZU8H9bbbKCEj5yv7FhgXD2S5AfQ1vi
         zDCA==
X-Gm-Message-State: AFq9FYKrsevO98xTGOry1eYRIaOkw4kE9yKpHDq0Mr3ThyqIeE9TBzdd
	1Sl5FTdolTYtasetyhibLIvKo4AlSYbZvmUnmb2e32q00smQCY8aSDOhACYd24n2U9zVXFz/RPi
	YrFLgnSkqEB0A4pLOZcZ7YzMNyHhnc41Mof/6ZJ3RYU8=
X-Gm-Gg: AYBFou32dxWKFcsZGIBNYr85wJxELo1kTlAxSRpbB8Yd0tUpfJP6FzMaPN593M/MkiL
	V/Zm+XgZP/yfcerFeEYe5WRf10jnXj3WszEehkI1hkyCLYS+O0Q8Z2swTtbBhHND9/VAFvjc8bP
	OhZMXEwI55xyEYB89WJzhRSQV0oO2wA/0tmmZLeIdNvd+zOUSQhpb1utiIBgErrG15ZVxjO886V
	zO76c6Gl7UYcshblNZTRzy15wGZOXQEF6Q0AH0TkKZDuYCG+nOg2M8YPrDc30/EC0Xqx5kTF0yr
	6Zo6HrtFhLDe/mAXvBP5vy0VQGMXxu90+sBEqIcMdCR2W9eHAwlfgdNShuRPXK6z1ST6tqiVPdR
	qSFAC2ygDhhIwGtDN4SHQAeJBb0AqchmXvnrT1CJwpUAY2IsBZNuTyiWj5VaPhVvHXRrpZg==
X-Received: by 2002:a05:6000:41d0:b0:48c:6756:dab3 with SMTP id
 ffacd0b85a97d-48e3ebd0e47mr4403398f8f.3.1792860674355; Sat, 24 Oct 2026
 09:51:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022181955.35758-1-jay@artiphishell.com> <atvPbN2n5Pu_1wd6@equinox>
In-Reply-To: <atvPbN2n5Pu_1wd6@equinox>
From: Jay Vadayath <jay@artiphishell.com>
Date: Sat, 24 Oct 2026 09:51:01 -0700
X-Gm-Features: AclHuK9SHTtPwpvDvhnj_V5AJdMQmmSlgze8h2GHUfK9PvPqtpoJaRwbgZ23FHg
Message-ID: <CACd3oYNck3bfC7dx3-iNMCaVO9Ra1xLtB1Ws1fRBLg=4fuq84w@mail.gmail.com>
Subject: Re: [PATCH] cdrom: bound the device-supplied offset in cdrom_mrw_set_lba_space
To: Phillip Potter <phil@philpotter.co.uk>
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a0ac8a065e98e777"

--000000000000a0ac8a065e98e777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phillip,

Thank you for looking into this.
I've attached the reproducer bundle with this email.

SHA-256 (cdrom-mrw-poc.tar.gz):
74d42cf0c7974233fada470f2eec2dbb1c59719414a2e54619a09f52d55ca015

Please let me know if you have any questions.

Thanks


On Fri, Oct 23, 2026 at 2:19=E2=80=AFPM Phillip Potter <phil@philpotter.co.=
uk> wrote:
>
> On Thu, Oct 22, 2026 at 11:19:55AM -0700, Jay Vadayath wrote:
> > cdrom_mrw_set_lba_space() issues a MODE SENSE(10) into a 16-byte stack
> > buffer (char buffer[16]), then takes offset =3D be16_to_cpu(mph->desc_l=
ength)
> > straight from reply bytes 6..7 and does buffer[offset + 3] =3D space. T=
he
> > desc_length field is fully device-controlled (0..65535) and nothing
> > checks that offset + 3 lies within the buffer, nor that size (derived
> > from mode_data_length) fits. A drive that returns desc_length =3D 24 tu=
rns
> > the assignment into buffer[27] =3D space, a one-byte write 12 bytes pas=
t
> > the end of the stack buffer.
> >
> > This runs when an MRW-writable CD-ROM is opened O_RDWR, so a malicious =
or
> > buggy USB/ATAPI drive (or an emulated one) is enough: no privilege beyo=
nd
> > being able to open /dev/sr0 for writing on an attacker-supplied device.
> > The sink lives in the CD-ROM core, so it affects every cdrom driver
> > (sr, ide-cd, pcd, gdrom).
> >
> >   BUG: KASAN: stack-out-of-bounds in cdrom_mrw_set_lba_space.constprop.=
0+0x25c/0x260
> >   Write of size 1 at addr ffff88800639f6db by task poc/133
> >   Call Trace:
> >    dump_stack_lvl+0x64/0x80
> >    print_report+0xd0/0x630
> >    kasan_report+0xe5/0x120
> >    cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
> >    cdrom_open+0x1169/0x2080
> >    sr_block_open+0x9e/0x140
> >    blkdev_get_whole+0x8c/0x200
> >    bdev_open+0x214/0xc40
> >    blkdev_open+0x1f8/0x370
> >    do_dentry_open+0x408/0x1290
> >    path_openat+0xb2f/0x2210
> >    do_sys_openat2+0x126/0x170
> >    ...
> >
> > Both desc_length (offset) and mode_data_length (size) come straight fro=
m
> > the device reply, so reject anything that would not fit in buffer:
> > offset + 3 >=3D sizeof(buffer) or size > sizeof(buffer) returns -EIO be=
fore
> > the write. The sibling cdrom_mode_select consumer of size is covered by
> > the same guard.
> >
> > This bug was discovered by Artiphishell's vTriage pipeline, which
> > generated an emulated raw-gadget USB BOT CD-ROM (INQUIRY TYPE_ROM
> > advertising MRW-write) plus an open(/dev/sr0, O_RDWR) client that drive=
s
> > the capability-probe chain (page 0x2a -> GET CONFIGURATION CDF_MRW ->
> > MODE SENSE page 0x03 with desc_length =3D 24) and reliably triggers the
> > KASAN report on an unpatched kernel. The fix below was drafted with the
> > Claude coding assistant; a userspace reproducer is available on request=
.
> >
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Jay Vadayath <jay@artiphishell.com>
> > ---
> >  drivers/cdrom/cdrom.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > index 4f1fd389260f..5e910d79045f 100644
> > --- a/drivers/cdrom/cdrom.c
> > +++ b/drivers/cdrom/cdrom.c
> > @@ -571,6 +571,10 @@ static int cdrom_mrw_set_lba_space(struct cdrom_de=
vice_info *cdi, int space)
> >       offset =3D be16_to_cpu(mph->desc_length);
> >       size =3D be16_to_cpu(mph->mode_data_length) + 2;
> >
> > +     /* Both fields are device-supplied; reject values that overflow b=
uffer[]. */
> > +     if (offset + 3 >=3D (int)sizeof(buffer) || size > (int)sizeof(buf=
fer))
> > +             return -EIO;
> > +
> >       buffer[offset + 3] =3D space;
> >       cgc.buflen =3D size;
> >
> > --
> > 2.51.2
> >
>
> Hi Jay,
>
> Thanks for your patch. Won't be able to review straight away as I'm
> travelling early tomorrow and busy most of the day. Please can you
> provide the userspace reproducer code to me too in the meantime,
> thanks.
>
> Regards,
> Phil



--=20
Regards
Jay Vadayath

--000000000000a0ac8a065e98e777
Content-Type: application/gzip; name="cdrom-mrw-poc.tar.gz"
Content-Disposition: attachment; filename="cdrom-mrw-poc.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mvmmy09k0>
X-Attachment-Id: f_mvmmy09k0

H4sIAAAAAAAAA+xbe3PbRpL33/wUHVrlgDbBlx72SqHrKBFSWJZILUnZm/NqERAYkohAAMFDEmO7
6j7EfsL9JNc9M3jqZW3k3NVdUJWImEdPT3dP968bY98zm8++8dPC5/X2Nv1tv95u8ff21hb/K59n
7e3Ozuv29uvWdvtZq93a3O48g+1vzRg9cRgZAcCzX4z1A+NYEP4RDP2xj4/69wNvxvSQRbHfCJdP
vwYpeEfo+zb9b25ub3L945jOJtf/Zmer9QxaT8/Kzef/uf6ff9ec2W4zXFaeQ9EO4F//9U8I2MIO
IxbABe8MwXMhWjJAmS1YBPPYNSPbc0MwXAtIkhFEgWHa7qKBBMcx9YQQeB6ODbwVNG3XjmBfOxyN
NWii8TWgz5D+CtvDyDYFD+AaK1zLx3XFQo0KcgWvWKUyHXeb4TpsXrDAZU7TYrN40ZRLVj6CakF1
Yzquwjl8/gylwcmwCjOXHlQ/8rXOIQ6xkbPN5shuBESgQuwzWlXOot1FrCHmtuAtXychqXtuFeTT
eYtcXTbd2HHEYMgPZum4BwYLgevskrlRWL19cMqGGCXnhE3mGjMHV8pPwP0IWerhejXzHJDqJlEj
bcULLBR3F7j6wTeiJahvAUVzUaugFSg1+FQhJnB2t7rRru5xJeHPTpW323MQYvV3NzjNDRxZhbe3
byfH2R4ZlFtJJFLUTWJ/zAJBFXnihPl45oTsjomHvcGx1ofIy0z4FgJzu/KlQtuDMNCF6d37+Hoy
jk8yLbRp8a5fBXbE9DkzojhA2y1Myo3IzVsFV7LHN29fLD8iN9HzmXs/l9k4VPtpYK+MYM11CYrp
rXzbQXGwlR1FKFcDGiae4AgX8hstMB3PZbU9mBuOAzPDvCAZ+o5hu1zhjQoq+jtQEl375C90Z2bk
NiVb9NBHe88T/xpzqOXs4asX+RrC8PfUVF68uNvMsrXQUu5cLqOFbuZBy8toKvxAVSup5f4uPgqy
raAxo7Y1fvaBtCdkAUIWt3lovnj7EU6kOOEW50dPwevcub+ConarFRMd7wMaLBHLlu9uKOn0PFN5
s6pW/qdD7f/Kh/DfLLYd65sgP/E8hP+2MDco4r8OQsA/8d8f8SD+i8OAY0DmXqLD50gwsQiOAQ88
d24vMKpxFyLjB0eBAlfB3Av4K/dScDL+AKPRPpx6B4gBkdhZyMj7gBdHqjdXo4AxsQAoK+OCwahb
g9DjFEIvDkxGbmqNqJEZluq5zpqgZM/3HRvp0Cg8/5e2hT4EuWWO7eLKnMU6MBd5MWmY8ALSmYDn
c5RaR0Jz2zUc+zccc2UjxvEcy2LzZD5FHsFbCLPfBitjwRrQo0DI+cUd+HEEdoh00IfZATMpgqKr
N8DxFkgbBXO1tM0ljgHbDX0xQHER/3LYzJGu4dQEoFVZjLHV9tncsNFXTsYHiFftVewYxK6OCrED
z12hI2wKyYRNLmMVI4GKBFSMBCqPBKrnzZoz1pptd7Zmb3bemK2ZsVn5MBq/u5Mi33OwYpaOPuCR
hEdn0+4GUW9ecMlU9nsTTT8YDQ8HR10Jt1UhVPnWEG+V49FRfzCWk1FmYWV1gYIE1Uf3jWSr+EeM
qVb2zwbHfR3furJJ0tKFeeLsNL7wlnMw0ErWBNZLlsFRH1JvSjYw3NB6Oa6rYvlsAA+l3JpQ1b/G
NsUsaUbc4KVloZKjICaBcglDM80XZgyHsdTeGhVt2Ns/1roKxv13p+PRvjaBd73j48lPJ9kPHf9C
X9s/O9IPJ5i/9A4GwyM4pB9aOk/X3mvD6QT6Pw17J4MDXXTD4dnwYDoYDXX+OpZkBsPDEc48m+zT
f/pRr3+kTfnPce9D/rV/dnLyk/7jQZ+/Taajce+I1pwcTAawf/xO72vv9ckYDvrj0QkyPOkNK7UK
iQLFgnJAAX4SW/z4H+dfMD+wPJxd3UCrboZmYPuILaRwQVX5USmKHFsF5sB2JFklaIWyZRULEWlZ
01KsJGipYiV/lGvQaDSqFe5f1APBRRU9jbSx/FCEjmgJiakRaHjRLq92yQJ7zg1LepjMFsI4uLQv
qSFHE/FMTjCptgvaKyo3U3rBFDKcCXC/0m7XkNQCYvZFwHxQf4XqP4TB6xufkL0v3XXZ8m/gb4DR
O3wpT6vk8q9k4IfeeFgcCOT6xGjEp7dpUgQUfmKExwUFT/YuZDp5QJnqL9UNxcXjaNaqKY2vUCox
0wA+HPXlhKA6hpSFEZjL5vWbnebM86KmpPl/EkHy+p9nfkP09xD+a7d2dnZK+K+99fr1n/jvj3hu
x3/CIjj6Y9fMjHloWxoYfMOwCPduJqVKjfCbeaEWQOBR4MWuheAvRtBlBrgMhPbC5dUSUOwwjFnj
l9Bza7s4GAB94a7wYLuSmkSPMyITwkdeTAFvjlR+Y9A+Jz97B0N8/X1egnS8K1A4Wbg0AttwI75H
2g0BTQgN146QIG0QEdzBB019/eY1h7NiQZcxK5Q8vgTyDnwyJ6lmWICwqXRErxA7huuZd91E7vwZ
Q2OjGmhgrOYEEeGv2smZJCeKo4vAoHSdyMbo1exLjJQLJEgGCIZpkgoQcfLMNjCu1IVhUSn2lWgJ
g5ecGggsG1AFlg44lWENGI6G6ng0mnJie6KDcXRIEJ2DhH3sPeirFEEubUPSytZpWvFqtdaXpsWz
ASoxKbUwWbsFI33c/zAmBi1kXaQJVPNoyD3iurbhUMwOPYz0KGTT8MkILIHHVTmA8MHuD1SGfLsn
BWM4mCXg8n6Y7RAWMQsjCHj4iOdzFJFirViIAEDiL9+7YgFazlzY4ZT0KuAIbiDEvlCovmrZFqfI
rn1kgbRI0qsi/k+q3RZHAGh/LEBKwozsMJ3EoT6aKQY0JqstNqYO7NpGdbb2MDFgOFSeHX4C5hxV
8nSCUUbjmkyQhwbHxnX4JbZI97O1hCB4KpOkisIWjpNH9WNvOtVOTqeTcxSMgkDEiJ0Itmt88CnG
RjKb5XphMxenMQNTFLI84t8xYtdcJgr4+QVmJFZ347uf5R4835d9SOnnC9pSdQOHVH8WHwOMKFPh
6aAvpEmnymWXVPuiGU0+TZ3TDEPWEXkCFFcqP2pjDUO5YlLpXsFcgJdpEUwiOv9Rn4zOxgfaxxYi
SozuL5C5K6tWrbwbnBzhJJorU5C7YvZgOJiO+8nY9Ohlvxqmb3uNxW/VJDeRQ0kBmAYkcsXmT+1d
dfsL5iV4gvTp4ESjNKiz1UKJP0fDRpu2wj1YoITR2aFhMwFryF8aMKcSJHcYr8grkm1VKu9740Fv
OO1WLwx0PdXKe7G+zHY2ZHc1nyO956lR5eNHEmd1gwRB1bdz/sHjU1pP5FZxDiv0rMSDzNRtDnaA
zwIFWUADSnN9tMYwqiH+I4uF9h58SVcRQqw+tEoqU1xCTslTq7x7f9JValRBJsKB8BoXlyvSq3qV
vZ6f50Aon6SS43OAOlXTj2HpIauFAqpkJaXhByykM4yZH1LgjtNhAU/ScuXXPPHIXNxP0pglFKcH
KL7QIddSSwqvRwSwk9i4uBnuIjtyKBwY3PlRGdQVpVgGV8ba92w3alT4UN12088tjmeSN+SfXHiD
xPEaVB+IkYTr5/dUwDNCd1a5ywT4x5LY1Y0oYis/KjHpZkyKBuHKu8Jmm+IN0wL3C6Xu+YHcYyfj
+EtpmNBI93c/1dv0mxwzkNuCDbe5kRx78b2Isy4m7/Lqd9LCm56D6nrS5YZAYT7kzvV7DPAr37FN
PABEeA2DvpYEV1nxGg2Pf8oit6BGxMgxe3EAIuqq9CEG/aucqzAXYUYgojaGs6BVa8BEBE6cZ0g6
FEOTmSaiN1xFfFPFdRMwJ2sbFO4afNqviAfUcI3muVLRm+o7WzmzQR+IJ4bn97lWVXqXxBvlerhH
sHIeJNdnYGDBCFOVWKAbRetJi38r7kpws4LAIgpdAQB8RGdmV22DhxLu8rcCwZwSVMsOfcdYoyxd
lh8j4UWV44tEjUUiasC4n1ZX0GltvcE5Kx86uTE/QHak3uZ+U5IJL3J2/auIpJVc05WBMNLqtnjT
1ZKqICI2tlBINL70bZSn7+LJJ/EygvDk2WERP6vJZvInHr114lKyEaUvrvSEDmO0STIbhwlQyw8i
B1zQzGAUguiYvJkwXxJjgdAsYMZF2oKesbRC+i4FsaEo4terTq2W3ypGiA3RAyrC6I180C0GiOQp
HesIMRw6RDDm/OPvpzyBLxinObKhqMVxEEoehPwf3g6vYtAPCYZuqK2SbPDWTnk6tWty/lEOxQqB
I5Dg6RbGAw8IOnpXrqgsU3DBw3LJXJugojivIQnIhe+b6N6OzrTJVO+faJMjfV87GgyxrVkv92jD
PrX73+dshnwaX/4WVlEZD9pQSfYvX76EgzHiNxhrp+NR/+xA64OS+dcajcgkLczafTimff6QT/s+
3xG4Pmefvz9bno7ODE+eg54sf0oKlTX4DEtmoCDf4C+S6Pdh8x9N6mh+n44LGIJcF1p3Xz2Qu3e9
Gxkuii7bfbVMsp27jFCiJV2rxGzVcrf0rxneKg+Qae5uFuUSRgikJVEOA9kSTQ3dEtmYTexuKCH7
FdoosXRQLXVHaBI5HIBj7LJBcHJ4uOnvq7Y82qUK4FPE8zti+a7UABpW4FkxFWxpT8RNLrYnOCas
NW5QShMyRYaMVyATS5GhSSD+HHrOFX2t4jC3tZuUTnBhL4hkbsmTpHJuabiNLKkTiR4lgll2mHJg
uzIfbFTEKk9YiEzqf+bTkbzx3F//2+5sbpW//7Y3W3/W//6Qp9nkFmuK235ZOYmXgmLnQh2hAatT
tNaQDDpBoKJo5CX38+hWHVJ6oCKYq6MpvDoUyM+O4v8Nc3f79VatgZSI2CQigLtY79ILQLsBI7r3
VKp71WFmu/wTrChMxZaJxNMaVcicuZqhZU4ciXUaoImyl6x6nRiIhSe4If79gWpgTfHhK+I7NwI8
sjXApW1K16hOYghKFIFx9xidpWSOz4agDIZ/PRuMfyK0bftLXBuzy7XPoHXd2ubX6gJRHgs49ylb
mw3o8ZqUWBvB3cqgaifmCun9tCbQHT7T8I2Z7dgRfRNvpqzccyFNEX12SPqpgWHh6pEdMvperwql
8HoPi3LUbPUtaXOFwFr3STRd2sJmXQz1ePlPx5ChW0ZkkJoZryPSl/s1UBsgDjfl7rYaolxYTYqF
1bosF9ayO078bhu+FShjQ2mLvFtwXbgedVd78dqUILadSlsgWRe1dDLCDG2iDSea0m7VgO+Zdix0
brHQ1B3mLvB3FzpbMolLeZM6JVAeU24mKpIfO1uvNs9xQvL6+hwUOgq8GNbeUWfriMkTgkPSA8BL
lTa/OkFhnmIQApn53HOsXYEaPZHvERYPDDpOst5KVzibUWAvFlSAM6IlkSOV0c0J+p5tYDrIzWdN
Rd7kcm8DBhFd9YtDe0ZRSxAQBU7iN/K8hLd9cX+D7sTaZk0e0YVpYrLEm0AddUD1yLdI/6I6frQk
w6hUnmOaRt/m9aPhmSzwVZ7brunEmPf+QBd2bc+MnMbybamZzlB4s5mWLLbOTbc8X65emh1ZVHa5
0ebdaHLsWbmNis7FtpguMZeWYEHgcnK5Nsd24+tmHM6a5vIvxeFZF/o4Xfg4PhslrD7dQ+SOvcVC
Ou6npJxo93h0pMxX6KAbjQa6Tg8+Scw991Fy0RyNB3FUUBeY6xyqgKOh+ncX3cLz57r+vqf3xkcT
XUfYKSfy1FPO461fZAqttGrfQkK5eLhkDjrz8KkXkacF5QGoc510zn3kpWdbSXWNOucW+o+c98w4
y5zoXgLNFRz9A6D7+kQBKPACRYqYEyjNrxGsJ1iptGtUpM2lJXNrjzISySOxlDJJDkkRjNUhxh9v
9AhCnzGrXsirCg+/rcorUfBSuMp6sY2H1/SieRTEZlRYERBsiF2u2Aq9nPICG+rQqvN00Jsr+FqT
csDprumvFUXQrmFXQyzKr7zXIeEgm5rvx5AE7ftIcV4TUvylSCrrz5OiLi4mumlPfzOlcZ+nkDyT
ex6D0cH0WKfErg6005rUairhonZvTsurlk/6cpc+MZuT6kyt7h6WxmfDOnHyCHZwyr3c5E8Av/qL
yCUyl6mNlayBD4GX/E/+nASXKNi72OYXb/RDbXrwY13cis6dGZzJt3PfJnIEqnKqPCrB5d5dm/Fb
ApDcuRVftz14aXtfv4/Tlv5hPJhqdRzy2C0kcx+1AYqcT8v/WOv1/032aeojuNfFpbLb2Geuxb+7
6ATs6JOwx71QaD5iK7q481bn4PDRu5GzH7OdJzem32FLjzalJ7ekf9+QHrajgoc0k1vQj/CT4ibc
2VhLveVX+cp0GnF3BzuXszjULfxViMKbHQzDvFT/Ney93z+b6H18rydzvprFdOo9LJLjwHbHeYTE
6HxPpr3j48dJLJ0m2UGUhqujVYi8zXb5XWCRf1VKVoeKjQLPIdO7FXgIq7RdlwXCVjgKoLT041br
LzvnuODetwCfVJbI/FLICzRUmFgZYYhZFi9V1KGDu3IuIPFkTw5QEzS/f3b8DjGF3uv3xyiD1vWb
drFvdDaVnZgvd9I+PGcnvb+dJkrcbndSY8nJWaKlnBvGFv6Kh19opTE7Fol37umKO7BTuvg6OND0
yeA/tboc3U9pTanycnN0MtC0SNJFsrSFVisjRdwdOFQjSkfU5U8qoLFARdmzYE63zfJzJvEsnUZz
Cp2ngRd5Jv1LzELniXF9St9sowmiyZbo3NmSvbb1HlWN8ily2+5sZiNOecU7Ko7Y3nn9JtuxYKC0
43a6Y/vEcGPcDFWOgmREO+m8QZ9qIUmn+Ao9jFezbOZmsjA2J/+YxBC3pzlZOj/SGOiWjHS1N0+j
aM9bCYC8/b1XHpvqIz/cpoYbQ29DAUCn3v3qoV4coRsAnb6IBPYsjpiuK4rPP71TQlIy+fwuzfki
s3HZ1s2B6tvsPjNledc6M/zEwMrGX56SG3019dBLF1fpJrnMTY5r+YVQo4NE0mHJUsSIgsLfG07M
SiPswojUHvM0Vr1ErOk/rBXbkdvvTaf6aKjB53LjRDs+PB190MZ5anTAKNwV5Nm63pQ2/CUxZdrT
g6pIxToYTrXxYa/ghe5Sxs1J+fGpQNNTVBJHz8EBrhGxCYuo9H5jAE7UkoCQsNm5dYmcd+KiO+5N
Juiw8X/yH4CQm0MXh+7hzW3zUwfHPchO4hRLT/NmMf02YqlD5A6rdTex9MMEpB8mcvaU0surt6hb
frq/XrfasH86Ql09RrXJnPzwRCk9ywoYl3u3EFjvt3lBOuXlb4faWKfZ+aNcCB5ylgzBN/R/aTj5
vf53e0/a3DaO7Hf/CkTJOGIiySIlOx4p1pbiI1GtY2dlZVNTUy6VTFIKn3U9U7Kdzea/vz4AEOBh
ed5MZuZDWKlYJIEm0Gg0uoE+sihC64m/D46UgPE3QZIU+i7Qwgt378kE2ZDXaqYCRDaWQy5Ea0dZ
7ZlFwX2ygfYCMG5JycG9ODiwN1mgyK91PE1otum3e5ng82LQ7529bVtlvUuemz9z8Ya8hdo0lcJ5
9eNF2h6hqfZn8H9zhw7neQmEYrn12NZaGk4mFPMd6OM0nJdjqVfp1qoOO2VPvITiL4RnFCnqBFoj
kPYQYavb8Oe1mMOfly9xc5O6B9CiF571ifjX6FL2NnlbT21ucsuUtvBHisyK26GwTkFDvpdMfvjm
E8y2t2fdAeiKMKjNRtPbbezurnloS4DQw1JS+sIuvZstjXYgcsH3r+4k0Wm9MlZiln6yGqWfoFqE
J2TJY6RrMZ6OJnGbaQy+dRWtXrWEe9A7Q1N1FEWrncSiV9eartNw/Ksc4P7Vry6pYQ/KX9yr+P/V
K2BEUbAOU9/FsV3LXuESKZawEFaEK8ib9xHSIBL2ZEhb+1W3bT/lFYrfMPzPo3kgjcBI5eudZWow
wy6sARzU1tSX69XwKnT3NDd6sWRm5O7Bza3zVSxhjhzcdjr7bfjpws/t+v14jFMpC6fhZeAQ9kw4
XlMB6nTcPfztJfAb8JPsxPUB48g4kMVRWAIvCtkyDpT5iprLfCRLx7qLpb8IwhbS90gcdNIHuuV9
Pm1Fa68Qz5BAd0qX24NiTSrG5/JLspmno2CETSazYUx+3f4sQAa7jeIjHtxmWD6dnMchtFrjhluY
MP0l6fEac9QvBOCPluY+WBS7dWRyXJ2WBeiik7Dgz8EN0guV+4fYFy3FxpNBmfAhNDBFKJzUXE4A
gcQit8zDFWoJSGHYkLY2BSyzHQB+3huZCxNg6vBo5+jfR8IyTtgGcLB4zCOyCKcpw7gsw9IaBWzb
IK7DcEmuQLGx4TPhpQM/1E4WYTkiNBZmWZfLun5OWXlmX/b2BY4r+rBNp4s761tyoWyM7fq4YWn1
yKwjV9PGK7sOGyBYaCijechO/1NFAIbwV/c9skG7u00G98q1wY3WQbTYmUWxbxbe5cJ7qcLpYnu0
NHri9Wux64CGhJJ8GwtOF6MAZRY5PPEMyoGA/gUKOzjocxH+T+ivTFivpPDQSEQMzUK24f3+Jcjs
r+p7MK/wC2h7iI4wfOA1jsJpEOdXdD2oSRUL3jez7yXRogBAo84iCxlmpui03kA7aINu/RTdYsgK
nKlcRtnZoNnD7Xo6D2/IKd3mJDWz/ocpahsZ6xBp9KetZ4bMdcRiPEbnp73qK2VAYsD67TYkeRYk
JkHg59W6TLOAp0C96jow75awBM5G02k1ij+3xUtPjNHFUfgTvwagoEoCjETS2LXEUXuooAYQXAU6
78g1KIMUUR68O1a2JUAi03WYzIFvmcmPeGtnpvlePh3sWURgDfFb9MqKfOmHgVBrf8y3tjQbXeE2
CrxFRvySyyZnEvyyw1xdlYQbyVihhSdoTK7opQpa8miGkfHkUqVYGM+iWqIipMbDHos6jEVZLeiO
bEQVRG+nrUiDzbQYuoaCdZXisJvwF6wSBtF6RtZsJnqvpgugPWNXTNMaUkSt9urSgUfjFbmrAO2P
rtAQCSUTsiczQS3QSfIOLdPqNuk9eXhKOzl0WHcKKIKRY+klCjmuwWSwmKvxYD1m1m8qSlIYIThK
r2AxBkeVVALEdRXkuuXoC7Jf6Ro4gRk/h8XzTU30CUYsnvIcBTkHhIfAEixiP454PkfzMitneoX3
gyspPAQkKRtS2N1oviq2zcgVP/jHC160FZGxaYqEz92XJRJ8KI2wbgsgiyXSfHBFehdvrd5FK/8z
CjUKvD/Cgb93vRYoeIBAaUmpG56STRp7qdGq51KtYYcpbTjJHPNAO1QNfvlwPIRfTt7Q79ctYDfh
bHGLS8Ijpgsa5UWLeQ7l3Ne9FFQp3dJ8BMKYjVZWNRIOGuZqT7JBEES4bwo9S81hwBQardBcoIW5
1O9+eouRQ0oVsW+gzSzo4qwpSazoCyq4ewU1Grh0l9xaHUs1jUJIAA2DeZIrjbWxwENdb8ih7h//
C71UeI0tGnB3P3/AX9lj5K9vcJdR0JlhBbjmfRjkIZUkGrdejFSS3dOoxa65+5u75u3qrnWPxGH3
Q/ewN/gFxYei7u1nJCDQqjQrB2RhvAy4mE9RY6cj4ACnb7oF9VByQjc2x+xjwrJxm9/q1yO65Y5a
DMJSmswSuyPZcVto0pBN3UfyBK1G2RSUUaMWwJZYZSKcsXKyqcXNPdkejJujjte7GCyJjlUtY2gh
Tab56JhE+QO3aLzsz8MHZGUl6kWxkCpHW6AdsnpNR5sUjZEizkqpbv/SktzU01rt50tQFiZVWAoi
kMsVEFIEZ2sY/gPkZCdDbH0ZicTbt1slIbl1hLOqizJ1y+HKIOy6tQeozvUytJMnM+SsvkiuBuEZ
8xJkbHJpKzOrcQqg7Esong3FQoDuus2661pXEdkr4cw7aNUZxasd1bKXUntDPBnjTjBdue+aez3I
jIljPIIZNkcGoZK5mbgYdAcfL8TZ+aB30jtMiJY9jEggGylv98ezFVNC3LPHl7aFyb5uk2iYjwqo
Pl+sojFo/HSi58sDIm4p0GfTXmXlemhzYRNavF5iV4GDc7MIoKGI69XRXlTzeiQpZh7eyebsFCAQ
Ye5ugslVWfppZUA8kps2G+YiMTg/hDZ9eN+F/2GsP9BQq1gG6MtMY4Keo9dFg+16BTIRIFhLNQm2
0dMAPvrgWLsFNE+TEcNGpFqkh/WhirRwZevtbiKu7lF/53DQP20ZuEBGAnxkeNQddCn+3T9tGtvb
1BiGMqcTV3vWepuHcNc1h/Cod3EoMOxe/z3N1kLZtfngrGykh1HNurCQxG9GMcqlFT52oP0lWxxr
PkJmsciRO6FEl97xxaOJjoZ/v0iaaVrSTKrq/qZ5x4IcMgSagQVIdOtS9CHBYgxXSjp9cGhlKIGW
uYx+nF/P0Rub9wTZO6ul9L7/hDeLuCImi0UgWUKtCFm21KDPzsqoo4nXrJOi0uZAQfEPUt1Ey35s
1EfdeM4Wj4bSlemU3jJI4MxFh4A7SRvw1jKJnCtV9h2fJoy0v9ubTyobgG2CVrPOBvgQYuhf3ZWN
o6UXfmLmT2WVRKjt6nCLpXnZzisTLYhK3J+9y0TfTOugttJZ7fisdqriQXTDJgBleEfHU0Ql+4DE
JxYMrTwzmOSAS+OTXnYENtpRJfHGKCK/tr0tZGFrz0apy7Zmj02ucMtZlScNnhCkPQ3wxqmIbami
p2ki9R1GZb7JLWIi/51D6G5bUKJFtRMiYuVBVZueMBr5oBZu9a7f3K4stUcswp3h/+eOXSxj8oxH
ZYalbzJVjU3fJw9jGsj4CLdg8KCsHNYmNaWgnB4fDpyaOLrBOPfoaDIPRDSZL26MbcLfjzobbWg0
lsKbVVLjzyAw4Ab0pyWSiZpCFllYp3DFeMKVHhXsj2e9AbH3X9DLddDto5B5/gEljtPT80/w6v35
v7unIlz5NfJW5amFnK1m7AEtjM3LC4zkcnjxScak+F2YMs5q/Via3Ma1mOzirENs/W41mvDs1Ee3
8FAe2iZ4RSCKSciz263fTsxy5vlqtmWoeduPK0YpWewhalZbhcBEaZcwDm9oj2q6AOZVphB+HMTk
4ngwtLRXx+a1L5ARD7Fame/Jacjct9MOVJtYKnrvlYivUytIVQ0DZS5Pdhnttjm1/oTZYQ9Ew21b
HJQcBTbMAypreAh8TXEcjFFTdm2JhEhnMV9F83WY5jwWPLZ/scwmYalznJzaxkroZ7fV/IpIyElR
kpPqgk8zAtYqywok72PGCrztWwxBLvFnH09Pv5MhzECe87DzbYuD4iD1KB9wGXOd3L7Zj7H2nXws
eUbIg6fHTZI886MGqlFsgGSNB0fmtJzbT4bn/3QyBlx6dumYmUq940n+E0i1cZswgsezMqBmWTbc
AbiReAH6W5pGJfV69Tq/rqv9wXCFJ+wgf65SsZryHEstt/zUom96llpvdJcSB1McWuXcf4B9Ij/o
A/hR/imGTmTqE75hrlI5cg1ifw+6d1JNyZznPKIV8RpGKMS0AeMA2gG9HAcpsHj500UcljOvvll3
RNlfKJTfGs3/ZhhpFANOUUhX0qQ4pgCqxkTbGOeP/O+vKPOK1WtFZddMZddIZfDHpjF1yWFuGMOc
KUMD6z16YKkKDq4nOkysjMebsGrMS7G4Rg9OiR9POwubF41KXt3U6D9ylLNzRp0bx2iDg7FxdAC0
VF2LtWUBJqzexuK3ZPHD4aR4rsS0VCBPjUvbcew7slB0ZJI+SszKv4PPvmVIpj3dApad5EsZQGGI
RUjO4HvQeIc4KvK2bVuYoQ9Y4jlnerUbJm5ZX01etrf98YRNtZ20UNI7Q78LwcUDFFKlsRtNbAlb
1jJM4zZ9Ce1v05/CeHMbPpVUy7rn8QfQvSBVJEELFtFttbAvRRyFeh/+B9FxOzUASHwVoWU/fuAU
VTUGS1U1F0VdO+XVp6QIpkRTpPNXN1NpEwd6PdwUePAbjnbRQgvP5MYfLUwv/khzgmhRI8e7GsmF
9dRDQ2/Sev1NuJx+IUNtoY3a1DtD54dWVjtXfW412aVvs/1xrz/snak9AO6FPKO261jn1eSMePyv
4dtjdC67OOz3PgzO+y2Deys5Wx47M6w7dofpdMx9MsMwXKRL8j6WLQcyxJRvW3rhYFSoTQPpWpfi
mFqRqUk9RpUjTGbYK6PZkMENLTzVJlZZHmwTzL9NzYEiv7slbFue35KsjT7Z5ic2rY5sy6MbkNYu
0m6xxrxPgOFykrdi5e/XKsrLaIbJviVxssz78k8BrsMmeRlNsdm28SLprD29Ui3MzIqCtkmM8gmF
hgk/cpBaBB67pv2oWr+7pXzcVtBE0kH53pX30iLsUU2u358ct+hY3Ag31hJvQUJ/P7rn0GFXM5Mr
1e+7rhUWNY91kQUUlEsRXLrlJLa6+JUc6s/HeS75qa6c5HQl8czi5KmZ7niP7I6H3ckbxPw2ZXbr
87e+nxBAE1EbZ6U5I7+ld3TTSiA2ssMbAXJmsceUI5tvPTR3PuSKpjc3tG1Vuo3m5lHRvsp2su+X
Ywl5wXtg0NkJW+Ch50W1I+2iyhiJqkaHGVXZmpF/bViUZtta/0NaivIGLtKzUWSHPyL+RftPwJjb
sD5K7Y2wPIHRiYKyo8Un0metUEopsYsiF3GrKM/Vh+Pjo+G73tt3FVHSIQRL5k1NC/tmtByDTKiF
Mk4UvEK1HVPRgTJPGaNAfkfBqqSM6DdvnhmSUnhr7Q+RtBTemtJSeGvqTQ/EycnbiePXzrb5GXpY
7UhRpZ55kd4KDW/TyyJOhbxgPox2GbTnD9uAUwKa0W4TcMLhu59kBB9Yjc6ODwct6xM0igSjJWSB
tFJpMJViyIP++Wmr+NQlIy2nhsV678g+IX7tpqTEcRK7H2zst4ea3T+GVbQYHfT6tyMDD8I3YTop
swF+hsMX9tHa26yjIvNXB1n9G18Y/1dHIf5O39iQ//UV/Evnf/Xc3R/xf/+MKz//VxKXGs2PFlfo
CITZnPzPISYEx3DWSZxrFWCbwoT2e297Z91TwRm9jNRfgnOhZFN9cR6lvCRfFFwqyfH1QIqvCkGi
uKa4v4tpaCmnF67/nkMhUFtiOLzfa2I0eJILRpTIxQoPj2FmEU6tVssGpC2MJZvOKhUswhit9aA5
VUzRMJp/WX1GQQDPlPVLwEaskPgcpbEA+o5JsnorMi/RkcNlcoBqHAWhzKjCKVKS+ODkWGHmjcJP
Aagg9KFEnOAjSW8mjQdVThr0WEWT12uMpfxSID44NQ13T4Y4j+a3i2uFX5WZgLPgLm6+VNCZCVM+
fSF8o+nrTYh5Z4FuytwuR3YQMznGFCYflrFJyLnJMdhtEM6WixXlIsHv9uYBGhFi9KMyNilEd6ER
2v1gyB2ASGlE2xhxGBCtUw1cgAAyFhgQRJqqYKZYTocCKFhF8Rg98jC9JtAW4GVGVL6eU3MxVwqG
X+etfAxgjKazKCZh/Yogjw0GSPPg82KqBmuJydUZZBL6v4KhT3HEfSDqlaT5nqvovpSbuccanvlo
RmlOi7LbITxP2GNY+mTnx7MStJdVXjt8V3WTsNwOA2sIooAqJycaoyNS0dcBGB104NJMW+TrOWWv
kJCahZBoWtlXWc1fDEmspi/RkoS2C4IUT1aUroHO7Nm7k53hZcUBFjfRJJpzNrQjmBZo+tuyklNw
ZH2HSCfGDG46ofNsBOIlkAMMWvfsCHFNfxoyCx1f9KjJf3Zr4lw7MZ10e6cavuskec9UtrGayjT2
FLf0Yegn4T2aiwfhNLqisOVAWmNMmg2jSXHM2EoxFjsyLXUU4O8RB8yAhuKOfs8Foe7g+aY8isUs
9flWzyMQKUqC5w16XlyvabzHAYBHu/TIGq//pkfrvzSow4tfLg5hbkKJ51tb8WfMoVsFZrGeTifT
xdUWIuugnGSJ3nmhMku9wHxR1gtOJZV9nnlC986WzEz27OtT/AqmORLV8H9F3c43w4kiemdHaI19
3hfvexcXvTPAM3B6mcklYc2LicWZS6Kz7RlQmDpkWiqiEJlN7FiyOslRfeCQEWgBIW7TgB54paOW
4wkjRmf6UiU6pUlIjAp5KqZMlDklODc5ujSwj2GMqYk1e1X51ym0MovVAXJ3SmPO5pbAx2tbV9C7
IYI6KJX4JvYXN+FB1d2iz+t3lEhkLNNCK2yWdAIRlVhurHLKKQWPt9wJJidaSdKUPSOazklrtr0t
IvfARTDwN1vNK67myWpeTrVGcbWGrNbIqdYsrtaU1Zo51XaLq+3KaruyGqPnWbkM3cUAJxQDhUKd
NPG/XSHTrZCxJ5cWHZGMlkD3TytbizGSz+iP/YYHFZrG+xeRAR1aQHhktHAvudHZr5gUooBpLU6B
5gQxT0VfLoGfw4RODcJUifYCYua3kr55MUK80bewjXe4Qo5JAgXIFcO9lDKt4Gk2hrdR8wtnAiYw
uI3COzpnBn56B+s8yGic/g84OK/OqiNfk261qs80vr7BHCBxGbPkYb6n18TZO+K18pKFJaijMGlQ
gotUYHwilRAsJ+1SwopOzj+eHbXEM8/gM9lERTmsy6xh5SFiTeAywTPn5rbahxVZM0jmaLFUb8k2
xetPKQEp568l4GSWpQekGgNUQ4FKySuF8g2Zcyhp2AAkZ7khzLB0Y5VP5A+SYozqcrY/IM7spJfH
klqeqshTE6Ir5a1OiWRjrC11WlvshUcuOn+1Gvrj+osuyv9E+WJ4Xn6PXaAN+z+e56XzPzWabv3H
/s+fcT19Qns/nPXdpgPSijFLIjEzPtSQOQtR/ZZJsTl3DOZ701Iv7saEM7SiR5U4Dil8yor+lw4j
MuWnNP5EzXuCCXFvaqJP1s4xpQHFhRu3Gjj7Z/dkcNynlOU1MQAYxodJtVapuJc30WwE3NTMcgOQ
SCGf4qlREGLeUfKnG6v8erRrsqM2jdFLMJaq2kuQRgb9gx1MNMOFYTG+Wk92JFK2gCFjgtNBHxgx
immpwqoY8906ZVoc9NXj4WKeyrioU+MBA39zPIT/T4BT63SOmHGOez5UPrT+YrqezeOWeM3PMecE
iBmY6w7+YG7mMO5sgQDFX7Zr218v+DhnjCQV9ZjHNcDQJLMI891EfoXElyUNsEEZNOK1NMwBxrs3
uoOC3FyunMuhTnO1NLNYwR2uzLLhPtwa6+5SrdhauUAlGcRjlqnuoNcIv7Sx9zoJpDyilikMuf3P
EGgJiozursXzr5TCBqSmb8+5LBDBf6AQVkEyAAFY5lNMlmTu/rveQFB7OBlhieXdXBxprOu36Nho
4k6PKUsnuZ3x6vU0AGM4PyZTL0WgdD4TS3zFO2z+lkMtQlWQmOV6yX5Tlrx+pYKXxrQPUVOdqjRU
pR/SyI/rx/Xj+nF9/+v/AJ/W07kAoAAA
--000000000000a0ac8a065e98e777--
