Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365303;
	b=TL3QyyA4sNTz76sxVe2rDmKeuCK2+vfuPVr4wVI8yfPqwxEz8L61gMVyNLP7mEaP1Wur
	 xFq8FbGXevr7MZfMM9McmtVXt1kT28adU7NLPxT6tBTMKtFgWfiR3QxannUsFf9nV4Y7E
	 AzsMY1AcwiJw7B5+bT7M1JiVs604hdF04G6QhTM403/+9O+KyZuS+yqqjH91VGoZLdSf0
	 4igyIALhUCx7n/tML6Cx/bMOpo5RM1M4GxYyvdIMHweGOSBFakxmmwUBsZZCqQDWzJbZP
	 rkO4G9I8JaXWo89v0ROciMHCzbITB2nEERwpdEAhNApUpsu8zUnGcDj5/f42KKszGgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365303;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=2jH/piz7IXQID8SoECxHXNS9pdS04OUkw2+Lya6AzpU=;
	b=4J/ysE4SHyq5bZGJpNeGOy4fuJGCU45xo2Kionw25nHyup6oMEoIAFtY/LPNZoC5AAqz
	 91aez7KViJH4rpU2IYvBQz/tmY8kdsiXLfxFKuxwpJkJ73Tdv9FMsGZ2mlmUNmnpwLelu
	 nmJ7BV9WTlU2FMsNMPPOuvdzHQD80MfjVm0ZpQAGFsb5+giHH7+IIKRSPcYKT2MDBnwHw
	 haIJ54zYzvkn2QTXI3b33PNcCIDHu76ywBLG6ZOxQgE2/Kd7a7JnvcNbFJgXRJQIYKtoF
	 VcsLcPvyEFW6mfs2lrRW1GhYuTBSofDwlDyun6/5Re0MZwrhEZT/4kWK2w2eZ2sGTqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=dzl7NKxc;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="hIWBZv/d";
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E971606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E971606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=dzl7NKxc;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hIWBZv/d
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 45566EC0178
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:01:36 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 30 Oct 2026 09:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793365295;
	 x=1793451695; bh=2jH/piz7IXQID8SoECxHXNS9pdS04OUkw2+Lya6AzpU=; b=
	dzl7NKxcYs9nBNhsKPA1gmyaEheoL+SZcCep2kftSjouJC/aHjljGb4tcD8j6Y3S
	/2i8ZeITW+OoIKfszUO6WLruAFIS/coE1yU1DxzeFPLNJntyHxVuR3tRR8COJCXB
	SqAsdgBzWSAFcqg26TyPDarekX25Z9yIZgKbsn4pWJjtn+IASiUK7glaRyH5eL7X
	TTlEu3yfdaly3J/0nr6f7YLa2jyMLxSgfHktQynvn3GBog9gnKKLpkO3/yB/iufO
	X/olCrWRI+EDrw2uzAJhwaRNJcNalqnYzJoWBMuhpZS8vz7zg4wUWwCnaGgCtpV2
	sFQQam63xFbMRlI5FCd6og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793365295; x=
	1793451695; bh=2jH/piz7IXQID8SoECxHXNS9pdS04OUkw2+Lya6AzpU=; b=h
	IWBZv/dAIXFAy0C9ow3U2bIwUxpgctZvjCLXmnbKwcRcLb+JZUmSHeIuNDQ3SINz
	Cg7YMIKjGO+JkgSa9xLZt1fpOcTgBr/SJ8JDihzBb7gXEeKZj/+XTY05wJQ+aLpO
	aEdtQB/kZEOyh7muJ1C9NlosqPBxdO6sX4WdAhXKGGCwnT+aAE7MjVJhRx52ECeS
	iVvgj4kDIBsI4iwx7Z/LZsYWK+FRV2JqeOO9LxwQYtdk8rv0LGmqjiFzgxMdzzYd
	p+B0wfodsKbS27cX7OCoX1PczXqpQ6BjfAVVeyzMa6iMqlQt0h6GTZhTLsQGV+qb
	by+Dgna5z+Rjix82xzOCg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793365295; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:c1gQSGLxhZswSzTEgvt+yjt8hi0O5uaZPYbfofhvvTESqty
	kbP0r5lq6dOEXCpcX9ivSlxLrV3BOaQ8vHXGId7dcXheQX+NJH4BchN+K50Vmy0A
	jRIYX58XACDlPrq6cfDgJ31pc9a3T2dmwDAu6YGGycYQ5LB7rm2b0jO/osZVQuhp
	7wskGgwaBeL1c3swMSqB1nYmTXbxZ/8HvTE1HPjKvcD+mo/c4w2iF6yjIZqQPuuR
	j0n3ovpW71liFSWrbUdJrfN7Js5eYPBcYsLgrRXCVrbjFEHOsexA64psjIq3bFKq
	KeUQo+svfyXvJNCQIxYSgMHStVem2nI65VEaneA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PnGyP9dLizWr/0W2VcF8WYF7PUWqz0dx7sAH5i1RmHE=:8WUAFWsvNJvpSu5zmqVhzorhDsEcG2r12iiIu6Hz7y8=;
X-ME-Sender: <xms:LpXkarcOgpgfPuaEiqd9vZj6NjsQ1on_HpWUoLkKEyOmazPJW1LBQg>
    <xme:LpXkasCB2-ZD_CdxB1ZwMFWhjYmuXI77EIUiOXeX-MwYxFQiCC51xeXdf7pjrcpU_
    2ZbyUWvoh1-y3mDlrNcvhAgUXqBI0LHJrrUNAU_Uikb7pZ9vU_SCg>
X-ME-Proxy-Cause: dmFkZTFf7/csJvu9JsxQhimglHQNP/7WFUfufAhiZqF3cvSwNKqK1uWKS2BiJFLuUko+ua
    gCE47msR7E8GzIspLZg9qwxRpLDfMaUjF5bbbllhSmqpeLaQOPpCCHuOO1uasWoCcFF2d9
    0wRJKE/iiCeRllwVrA5iGCBz7EMuCuhu09vPn1sA+hYXN6j5egDAtneya/+KQfjCsyO2cd
    bCfSFHUjcBk0QZQBjbhPhAw7kl16x4Ej/FaNNFIT/zde7bA22YbFRjd/wuPXNfkorBh356
    YdBx5pPje9tqJ+zbmgTKNdjIWa8av9kZsXWKN24j3kUoKrVnZrg0yUCwKdovgSix47cMGv
    YNHUOEb0fnp/LteCgbMmxlUmHrtdKvN24tqJPdjXPYh6CyKlJ3qmWdiR+KrMO3JwREeygn
    fEJYoiGVZ5fN+TMDzfJhhNyO+teIaTa7c5wNGwjJJxMu9zrgBWb9Pan6twwwwZwqEwLqtz
    t3MazNoRNKg5viB8DaVzxrxmuwyr5vZOoy051xyJ2xsx/RvU5RJlEBhabkyK7czVtCwc7t
    rCIUcJ8BF3NkWe8kvZWqQL1NOsFxJtXVhTsWAIf/1nzlAnj8xl7rN6A4B7buhfSEMnlLK1
    PkX6fX2D2xRXeUrziwiTjRrbo+ylQMQO6kd39Zp8mq0ImHzlAtKTFIZc/b8A
X-ME-Proxy: <xmx:LpXkalF0pCKahFNGPtjDshGr36Wrk54KcX4Ej81LPeSvOLH0IiHVSQ>
    <xmx:LpXkakasf0sQuKBy1PsrnspHk3Vl4zIRZlMBtNSLZQFwO5sEMdyQZA>
    <xmx:LpXkanCZhdLuR6aJarrL7YMntWejeNhXqarFZngzPbjA9i0F_ryaew>
    <xmx:LpXkasnvZcyCCDCKX9ZgClPQIYxbTs5vU3iWKc_kCtp7IAfHaXSrjA>
    <xmx:L5XkasdaAgZk2ZIy0pOa4cYSaA3oBLiRje0ueN--bzz8du3ugk4uECKc>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 6CF5A2C00082; Fri, 30 Oct 2026 09:01:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A0LozxmPDbh7
Date: Fri, 30 Oct 2026 09:01:14 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mark Pearson" <mpearson@squebb.ca>
Message-Id: <923f7e6e-3e1f-44a7-a3e3-6ef83c148db6@app.fastmail.com>
In-Reply-To: 
 <CABxCQKsV49CKbvZ2m2556+P=+q-9DSMdanzXk_v-syzZ=uJ9WA@mail.gmail.com>
References: <20260930002133.10794-1-vishnuocv@gmail.com>
 <CABxCQKsV49CKbvZ2m2556+P=+q-9DSMdanzXk_v-syzZ=uJ9WA@mail.gmail.com>
Subject: Re: [PATCH] HID: lenovo: add fn+F7 display switch support for X12 and X13
 Folio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Vishnu,

On Mon, Oct 19, 2026, at 2:35 AM, Vishnu Sankar wrote:
> Hi All,
>
> A gentle ping on this =E2=80=94 any feedback would be appreciated. Tha=
nks!
>
> Vishnu
>
>
> On Wed, Sep 30, 2026 at 9:22=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail=
.com> wrote:
>>
>> On ThinkPad X12 and X13 detachable keyboards FN+F7 reports the Super+P
>> key chord, which behaves differently from FN+F7 on other Thinkpads.
>> In particular giving a shorter on screen display time making it harder
>> for users to select their preferred display mode.
>>
>> Newer keyboard FW is now available, allowing the keyboard to be
>> configured by the OS to provide the standard FN+F7 KEY_SWITCHVIDEOMODE
>> code as used on other Thinkpads.
>>
>> Detect if the capability is present and enables the mode if available
>> on initial probe and resume.
>>
>> Suggested-by: Mark Pearson <mpearson@squebb.ca>
>> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
>> ---
>>  drivers/hid/hid-lenovo.c | 71 +++++++++++++++++++++++++++++++++++++-=
--
>>  1 file changed, 66 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
>> index 3976d7b53b14..6b4b689c8834 100644
>> --- a/drivers/hid/hid-lenovo.c
>> +++ b/drivers/hid/hid-lenovo.c
>> @@ -44,6 +44,7 @@
>>  #define TP_X12_RAW_HOTKEY_FN_F10       0x00000803
>>  #define TP_X12_RAW_HOTKEY_FN_F12       0x00000403
>>  #define TP_X12_RAW_HOTKEY_FN_SPACE     0x18001003
>> +#define TP_X12_RAW_HOTKEY_FN_F7                0x00000815
>>
>>  struct lenovo_drvdata {
>>         u8 led_report[3]; /* Must be first for proper alignment */
>> @@ -557,6 +558,34 @@ static int lenovo_send_cmd_cptkbd(struct hid_dev=
ice *hdev,
>>         return ret < 0 ? ret : 0; /* BT returns 0, USB returns sizeof=
(buf) */
>>  }
>>
>> +/* X12/X13 folio Fn+F7 reporting mode: feature report 0xa4, [id, mod=
e]. */
>> +#define TP_X12_FEATURE_HOTKEY_MODE     0xa4
>> +#define TP_X12_MODE_DEDICATED_HOTKEY   0x01
>> +
>> +/*
>> + * Select how the X12/X13 detachable folio reports Fn+F7 (display sw=
itch):
>> + * a dedicated vendor hotkey (report ID 0x15) instead of the default
>> + * Super+P key chords.
>> + */
>> +static int lenovo_send_hotkey_mode_tp10ubkbd(struct hid_device *hdev=
, u8 mode)
>> +{
>> +       unsigned char *buf;
>> +       int ret;
>> +
>> +       buf =3D kzalloc(2, GFP_KERNEL);
>> +       if (!buf)
>> +               return -ENOMEM;
>> +
>> +       buf[0] =3D TP_X12_FEATURE_HOTKEY_MODE;
>> +       buf[1] =3D mode;
>> +
>> +       ret =3D hid_hw_raw_request(hdev, TP_X12_FEATURE_HOTKEY_MODE, =
buf, 2,
>> +                                HID_FEATURE_REPORT, HID_REQ_SET_REPO=
RT);
>> +
>> +       kfree(buf);
>> +       return ret < 0 ? ret : 0;
>> +}
>> +
>>  static void lenovo_features_set_cptkbd(struct hid_device *hdev)
>>  {
>>         int ret;
>> @@ -739,6 +768,10 @@ static int lenovo_raw_event_TP_X12_tab(struct hi=
d_device *hdev, u32 raw_data)
>>                 case TP_X12_RAW_HOTKEY_FN_F4:
>>                         report_key_event(input, LENOVO_KEY_MICMUTE);
>>                         return 1;
>> +               case TP_X12_RAW_HOTKEY_FN_F7:
>> +                       /* Fn-F7: switch/extend external display */
>> +                       report_key_event(input, KEY_SWITCHVIDEOMODE);
>> +                       return 1;
>>                 /* Power-mode or Airplane mode will be called based o=
n the device*/
>>                 case TP_X12_RAW_HOTKEY_FN_F8:
>>                         /*
>> @@ -794,11 +827,22 @@ static int lenovo_raw_event(struct hid_device *=
hdev,
>>          * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Rep=
ort ID is 0x03
>>          * e.g.: Raw data received for MIC mute is 0x00020003.
>>          */
>> -       if (unlikely((hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_T=
AB ||
>> -                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_T=
AB2 ||
>> -                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_T=
AB) &&
>> -                     size >=3D 4 && report->id =3D=3D 0x03))
>> -               return lenovo_raw_event_TP_X12_tab(hdev, get_unaligne=
d_le32(data));
>> +       if (unlikely(hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TA=
B ||
>> +                    hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TA=
B2 ||
>> +                    hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TA=
B)) {
>> +               /* Existing 0x03 vendor hotkeys (8-byte). */
>> +               if (size >=3D 4 && report->id =3D=3D 0x03)
>> +                       return lenovo_raw_event_TP_X12_tab(hdev,
>> +                               get_unaligned_le32(data));
>> +
>> +               /* Dedicated-mode display-switch (F7): 3-byte 0x15 re=
port. */
>> +               if (report->id =3D=3D 0x15 && size >=3D 3) {
>> +                       u8 pad[4] =3D { data[0], data[1], data[2], 0 =
};
>> +
>> +                       return lenovo_raw_event_TP_X12_tab(hdev,
>> +                                       get_unaligned_le32(pad));
>> +               }
>> +       }
>>
>>         return 0;
>>  }
>> @@ -1366,6 +1410,12 @@ static int lenovo_probe_tp10ubkbd(struct hid_d=
evice *hdev)
>>
>>         lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->f=
n_lock);
>>
>> +       if (hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB ||
>> +           hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB2 ||
>> +           hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X13_TAB)
>> +               lenovo_send_hotkey_mode_tp10ubkbd(hdev,
>> +                                                 TP_X12_MODE_DEDICAT=
ED_HOTKEY);
>> +
>>         ret =3D sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_grou=
p_tp10ubkbd);
>>         if (ret)
>>                 return ret;
>> @@ -1439,6 +1489,13 @@ static int lenovo_reset_resume(struct hid_devi=
ce *hdev)
>>                         lenovo_features_set_cptkbd(hdev);
>>
>>                 break;
>> +       case USB_DEVICE_ID_LENOVO_X12_TAB:
>> +       case USB_DEVICE_ID_LENOVO_X12_TAB2:
>> +       case USB_DEVICE_ID_LENOVO_X13_TAB:
>> +               lenovo_send_hotkey_mode_tp10ubkbd(hdev,
>> +                                                 TP_X12_MODE_DEDICAT=
ED_HOTKEY);
>> +               break;
>> +
>>         default:
>>                 break;
>>         }
>> @@ -1526,9 +1583,13 @@ static int lenovo_input_configured(struct hid_=
device *hdev,
>>                                                 hi->input->propbit);
>>                         }
>>                         break;
>> +               case USB_DEVICE_ID_LENOVO_X12_TAB:
>> +                       input_set_capability(hi->input, EV_KEY, KEY_S=
WITCHVIDEOMODE);
>> +                       break;
>>                 case USB_DEVICE_ID_LENOVO_X12_TAB2:
>>                 case USB_DEVICE_ID_LENOVO_X13_TAB:
>>                         input_set_capability(hi->input, EV_KEY, KEY_P=
ERFORMANCE);
>> +                       input_set_capability(hi->input, EV_KEY, KEY_S=
WITCHVIDEOMODE);
>>                         break;
>>         }
>>
>> --
>> 2.55.0
>>
>

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark

