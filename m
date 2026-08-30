Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE82931F4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100921; cv=pass; b=DVEy73EjjkaoqWIvKM3rwgFIqhsq/JwI1BK3XeTN6atl6ATuKmoOglm5EG3+vovT+Sywpx2mWldJPso9lc8Lp2FLudZveZL8xL0UabrdYwdCWDWXiND2A0iQys6pBFYNub3+gD2CtAsEPp1b5INSPmDMtGCKKa/Rt9rUAYn9d+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100921; c=relaxed/simple;
	bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOco0eVOirNcUzDX9Np3CeQ35U81pY8riXfScpcjKnuspKumTz2RpwJQOQ8ZMEvbW039NT16D8g8PRvznVn59UZVHz08dxpCYMKq5QbE9iMJRFdnipW15j4HaEsXMPTbAaAOg8Z3YUFDTuJo+6fdNAdL7aIPZExO8AYZrZzrJ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXBURXWr; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXBURXWr"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52f9fc510e1so31343541cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788100919; cv=none;
        d=google.com; s=arc-20260327;
        b=bEBz7iaNME0YFVKby+O39EschHYgnCpHyGRN7YuGtnHBU+QeEpCoAK2c/Woa5ajm/Z
         speAaCHZvekF2jOV1ZrMmlq7YkM88Fq/XLygNIxW6X+XUslbd0GOEkVYiSj9li3JKD+O
         voUTmayHZIac/KycCppk5oCVTUfrlcGSIGZAkqia67aqr7WOF7b8S/QAyb986BcAU6nH
         It7DQTrhns588dB8pDXvXnX5Uy6kZNggCjjEKyUYVt9XnqI0BS6iLZxSbd0rvvs7ov/t
         Q1nWcqWZLvpBKmDXvPJaREFZir8ax+1wGRHel/mKQdmChXeyMqyFu0SuAfDQeGZggfCX
         vEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        fh=aZW9tLltSWaopci2jSIMCpElMKOj9lTVa88aqmOcp2c=;
        b=dM8quR1dxY9ITuCnzDY/aScbhIDltQmcE1h/rdxP4Af2n80aqFVqrVmKSTPmoJIC9Q
         bzeZn1tgvhpGuf2j6gqUZl8Ml7t4dJAPr6GuiVKw8HmN0yG8XlPu8rOsMRNGEYxJ57tZ
         eKe5aIpB85B1qP3V8vG4nxmL4e8v+Hd/cDlwDWt2nRkeT+QSrn3cA7Tty2U4echGzFAR
         924oOVUjFjMURPTF5eYNl7SuGV9uYtSXKVwdS8P6tEM77wOj+jygiA0y7IE9U/q1J2Vt
         pdU2DqD7LY9FQMlmuRZiTuLsgJYK4aTPyVucDtS1hPGcpskPv0xMqe0q2CPbjocru8Qs
         KLxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788100919; x=1788705719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        b=lXBURXWrf4b79f5nrkWuaWt/bQy4YBTe9qdOGvStNheZXm1l3O4r4dq4v1GJ92tH48
         3aVjqCenfXsOvuHfeaZ3b7TXi2tSmz/mjgOsFGn5qDlwnbz265Ov+kCCX4n3QoNf5qpJ
         b/GUyzyUFy3UcHMprvrb/KKjenhVCiVRWPOWAivkz2+i7zNIWlSE20cTaiyvGmXsuil+
         z3B6uQAHokmGq4T7Iv7w24rEbqIDC5E6DYBk21e3qjWksqCx7v0wemNY7G+DPCdvGUGe
         1pGsKO0qFSxEiqQAUZFJ3zLQ4yvjJnqu5bMAj9wLhJPb4GUw2PySCFWtQQCG5ZAAPUBw
         idOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788100919; x=1788705719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        b=QMx6gXtk+91m+nzz6G6GgSHFy6PWixClqJXXQtPKRmEjtTvt++abVv7BOH4Gq5cJzM
         hZ8LuRlvZg+Uno6i4QdKsdTvJ8NboAV7XDd+ul9ncrTomQPtf2lEHVPmsrZgF7/zY8eu
         ggi/2NFU1NIzZg20OpCogEt/jLozOBMiHhhPjefPjAykXgSn4v9/+0mSI9I6jGYgRDtN
         3RP6cEF9JE+TBVp8v0+hKVFMButZRGTOzQeZjA8W1xWK9+ueclmCnNkhjiDqniTQqyd5
         /2jet5obGZ53Q/8nWi/SLyx0H6Uum6aJVOUNVXB1a7dZajUqn4zUGVRDsI8e76jixVTz
         b8Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8idcX8881uyQ9+fRMuP9iiAuiqWdIe5ou5hmGaqIJMtsaE53wOWUfTY1ths9ZMCV9o+G9B+xZt7m5KH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mOu+T8XIqvy4c/zjLKh7F9ffS3/vUVpiOW2ASQQ9hpg3EXaEKV
	WqkdryQdpdaNSKweBur3PA8QrucSM8gsRRTDlfXIIJk6DlL5+DaunsFcHPpdepHeLYSd6DWaDBV
	1um/0vTlBi9CjFuRIdjWvrGaESuaskp8=
X-Gm-Gg: AR+sD10BhO9J2QTIekIx15/VMzXa6AMQEnN+OOiJntn6yBfTQR8QtRuirgrYfL6N4zr
	tVFVXtod4tajqLRKOpFK2813KVTAozm4X53s7WIEaSKQl64IUMo2013iSSY/Hx+3oGQn8qUl7L+
	Pa/w2ueOsSpBqmyjKt4LsUIObA0Wian1xHaOvqgnLjMX+sLAWqB2KyW0HohmHEm5HE8S5k89FcW
	MT1PMC2TS3iS8FdLWXLSUNslKdyeReqVKweLLbdcQr9BT99zyegPrFdp//UEixR6s21SIoUEsWt
	y82q7tzF6+NXLsmY7RawrZF1UFv7P7E2NYnDid5prZcZc+WzIYECVUV7FbbAsuOs
X-Received: by 2002:a05:620a:2991:b0:936:af34:468e with SMTP id
 af79cd13be357-93936bcb3admr243073685a.4.1788100919120; Sun, 30 Aug 2026
 07:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan> <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
 <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
In-Reply-To: <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
From: Mo Jun <royclark086@gmail.com>
Date: Sun, 30 Aug 2026 22:41:46 +0800
X-Gm-Features: AcwNN1WQigLhzHYMImI_yaaj0penJs2Fw872JT4mNKejiAeGOR1zlQRiow_gi2k
Message-ID: <CAL2p-7hqJOfzLuuXF0b=H1zAzirp4UN+Ty59W2F34PCAdstMsw@mail.gmail.com>
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler directly")
To: Armin Wolf <W_Armin@gmx.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1146124@bugs.debian.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Denis Benato <denis.benato@linux.dev>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000001b75af065a44b030"

--0000000000001b75af065a44b030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin Wolf,

On Sun, Aug 30, 2026 at 9:26=E2=80=AFPM Mo Jun <royclark086@gmail.com> wrot=
e:
>
> Hi Armin Wolf,
>
> On Sun, Aug 30, 2026 at 7:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
> >
>> [...]
> >
> > I think i found the culprit, could you please test the attached patch?
>
> Build the module with the patch(only "make -C .
> M=3Ddrivers/platform/x86") and load the built
> drivers/platform/x86/asus-laptop.ko, now the Fn hotkeys works again.

I found that after rmmod the built module, it can not be insmod again.
Also the system experienced NULL pointer dereferences in
acpi_bus_generate_netlink_event() which may related to the built
module.

I guess these was caused that the patch only change calling to
acpi_dev_install_notify_handler(), not
acpi_dev_remove_notify_handler().
After change ACPI_DEVICE_NOTIFY to ACPI_ALL_NOTIFY in calling to
acpi_dev_remove_notify_handler()(see attached patch), now the module
can be insmod again after once rmmod.

Regards,
Jun MO

--0000000000001b75af065a44b030
Content-Type: application/x-patch; name="asus-laptop.patch"
Content-Disposition: attachment; filename="asus-laptop.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtfwyujb0>
X-Attachment-Id: f_mtfwyujb0

LS0tIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtbGFwdG9wLmMub3JpZwkyMDI2LTA4LTI4IDE0
OjI1OjIyLjAwMDAwMDAwMCArMDgwMAorKysgZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy1sYXB0
b3AuYwkyMDI2LTA4LTMwIDIyOjIwOjUxLjQ3ODU2NTg2MSArMDgwMApAQCAtMTg4Nyw3ICsxODg3
LDcgQEAKIAlpZiAocmVzdWx0ICYmIHJlc3VsdCAhPSAtRU5PREVWKQogCQlnb3RvIGZhaWxfcGVn
YV9yZmtpbGw7CiAKLQlyZXN1bHQgPSBhY3BpX2Rldl9pbnN0YWxsX25vdGlmeV9oYW5kbGVyKGRl
dmljZSwgQUNQSV9ERVZJQ0VfTk9USUZZLAorCXJlc3VsdCA9IGFjcGlfZGV2X2luc3RhbGxfbm90
aWZ5X2hhbmRsZXIoZGV2aWNlLCBBQ1BJX0FMTF9OT1RJRlksCiAJCQkJCQkgYXN1c19hY3BpX25v
dGlmeSwgYXN1cyk7CiAJaWYgKHJlc3VsdCkKIAkJZ290byBmYWlsX3BlZ2FfcmZraWxsOwpAQCAt
MTkxNyw3ICsxOTE3LDcgQEAKIHsKIAlzdHJ1Y3QgYXN1c19sYXB0b3AgKmFzdXMgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAotCWFjcGlfZGV2X3JlbW92ZV9ub3RpZnlfaGFuZGxlcihh
c3VzLT5kZXZpY2UsIEFDUElfREVWSUNFX05PVElGWSwKKwlhY3BpX2Rldl9yZW1vdmVfbm90aWZ5
X2hhbmRsZXIoYXN1cy0+ZGV2aWNlLCBBQ1BJX0FMTF9OT1RJRlksCiAJCQkJICAgICAgIGFzdXNf
YWNwaV9ub3RpZnkpOwogCWFzdXNfYmFja2xpZ2h0X2V4aXQoYXN1cyk7CiAJYXN1c19yZmtpbGxf
ZXhpdChhc3VzKTsK
--0000000000001b75af065a44b030--
