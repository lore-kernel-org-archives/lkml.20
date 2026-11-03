Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665422;
	b=i3VePFo5EL/vScRxJHrQNEsEWiuAIafUEqO+j/wgfoHF8Cczak6zhRc2CIYVgndr5PMw
	 8kQKS/j7a+5VYNAX8J0iE+5jci0189AAHjTYxBJEO2iBWY04cHw7V8iwwqYxus8GEKi5/
	 YSpKPbQ9ti20kfAaOITHTulCowehUYdZjGgP+Xfi+9m5HR2X/qx9i7nDafaQFW9yJW1vM
	 GziNEA3wUGzgZGLoRcT4K09mWa5iGgc6ic8vkICFZZBN4TSbI9sFaxPmru+0K8gs29uJL
	 k4Y1gTKLzjDiIaL5h6goSQtd8ScDvBqK9iMjRpY9C4sHmuyKxFJtdLnCOfZs9tSr1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=hrGmlD26jktMjPkPLPOcAHkfV6PnA8xn/0EfS2MSqm8=;
	b=TXLdPHfdScx4nTHTuqoAH1IYoDslEJ9sT4apusIxb/rXMa4mVXUnH4YBz1Jrcgi3Z3S/
	 g3vKEQfX5I/bBqik+zK5D8gYaRwbZ937PqBF2X08JeAfnASc1HFpMZ0xlTvBP9LMhIGZ8
	 1W1Ko/Ff/YbKvG45tIViAjhVeVXYCu1C6gaUdvPyQwaGEKYpEED7eshF4hdcnGQ+nmPTN
	 ZiKL/lIUT5/oxNQEpRFPKqPFobu4sl+UIaf4YDLSUVzYwA9qZTh8PmWFuyAxGRQ8gkYgl
	 MUhJ5353F/DnN1uE2MmOi63kujxHcMSpAG4DIPvkzwN8kRPlN1L9zb30mMwDYf+OTAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="c3aaD/HJ";
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB03606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB03606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c3aaD/HJ
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f2049ea7aso266620985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793665416; x=1794270216; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrGmlD26jktMjPkPLPOcAHkfV6PnA8xn/0EfS2MSqm8=;
        b=c3aaD/HJUjlPPnOoqkvzaqA+EBjqPGV9i4rNP78+C3b5ohjgQ3hNMOSyxVyqdwKUk/
         0HyehV7U0ig+XyELQWvftOjEl6+LUV+zahw5NIMazFi47QOxrBUEAodfhtY9XU5Vwtc5
         2dFZx4pvcMYPJ/6ydmv6HZlhFAwyszkPW8msjWT0RZ/HzKbQdxzX7FS6nOvieCvUUm0a
         yegKZ4Rzchhe0nkOd0W6Zc/P56qLq0jx64sj8I95lcV9Sur3z8xc05CqmOFibH47rtIM
         Z7f3Flf6Jc7UIWnIcjYesiVomWfrcpgWiWq58OQaxGG8qERMShI0Rr2LJqFiCo7R4Mgq
         zONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665416; x=1794270216;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrGmlD26jktMjPkPLPOcAHkfV6PnA8xn/0EfS2MSqm8=;
        b=ut94+HHj63fMvxsvKGp6SgC9pYuMf4wsbe8vsGKyKifvFOS6SETq5h2cxYHy4blthI
         7ffJsKluGatxTqEnXlpe0Cw7FAi3B/Qq+R423uPkq/p0YaZPs+fHRlogPPLiGQpTNEG2
         Xf6P+yYIrfPX7QppiNGXtw++36T+Fri7C/jApILGbPQzVZ9uNV4x5J8xxgGkqznYXk87
         TfWAKRF6308tbn4NRgm3oiIq3Kl2nIewbHwDxYpVjHMH6R6+pzV7fU7NlO3tBKc5hYEL
         1mdOeXQtCF/lug+KB7j0KgCx3YBOrDGPHu04D/ZmsUqudQfAg41a7cuhDpw5XHDqU6va
         z9wA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ3CBR9XmUXz9qxFbVEPV+aT8/sEjvt5AEoUciIcdw9KZje6gFIv66rBXucY15bFk6c4YaL2DX4cZoRXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4PWiJIYMMPmE0HUql6LKMEhBJ6GCN9LnDmxtt4+OYoZfSh2y0
	uXUHwDquJNUTNO5jlYF2NaQZxlrTiU0hmiPBCHShbEjKF6eR8KkHa7xeoLXiVsOzDjc=
X-Gm-Gg: AYBFou3B9ERJqBHyMJa6LYOR55umwimv9x70rue2O4p5kvKwI79kKOPtq5/dOjGlrdf
	o3wUrweGMvKWVYH+R6Hio4FZoviXRX5C9qWBInym84rVMIiwmswgTC5zJgjQtB2DyGMUwo8YCFE
	cS+4quBo1MrVvZlD+otFdmMiPCnGhVQJfMfUe4VjhX/zEAZb1q1Obz1V7VegjaydVtClOrQ7ecL
	Nkh26N98X1lJphN2oke05qFsEwAinoCUrvxmEabV9Tqn0fJpWmTjLRz4EDIpbqjRczpB2otflnA
	U6eX5MogaV+faFCrOCeJ4z1ENHOPF9K4qBRO1oLpvdKz/4nJGV4fZttVGmrY1y6ysHtp/gJBK01
	V6Gy6ncqJWJYh3arn4hYqh6kqecW5qzMHtjEuwyQKgiM/y+VawQEmlFAPo7wFBNaqIuMgNFupKB
	2aks+28KHLAsyA22pyMfJU0HHUY+l0+VwS1O6V80E/+aYqJnR6lgzBJlw31DBRofUGJ3jhbQDyy
	zbNrbdOqn6rLoAm6TARQVvY+lRgN6MMR4PK8mrK7pnSOZtwPNrqAGngLr3bdrfVQCM28ncc330d
	8/22qbbeZR7/ZoiK/QBD/skMlXSKNsdLhDF0cNzIy4FsSHHP4KAk7XI=
X-Received: by 2002:a05:620a:800a:b0:93f:1dbf:6cec with SMTP id af79cd13be357-9442174fca9mr1869251885a.36.1793665416233;
        Mon, 02 Nov 2026 16:23:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2f7sm947059685a.7.2026.11.02.16.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:23:35 -0800 (PST)
Message-ID: <1e4d0ada5d06f1e5c8cf8ee57532cdfa795380ce.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/2] media: iris: add new rate control type MBR for
 encoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 19:23:32 -0500
In-Reply-To: <20261030-b4-add_sc7280_mbr-v3-2-8fadcc873953@oss.qualcomm.com>
References: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
	 <20261030-b4-add_sc7280_mbr-v3-2-8fadcc873953@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BPrxVElHcDLqlHohuXML"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-BPrxVElHcDLqlHohuXML
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 30 octobre 2026 =C3=A0 12:02 +0530, Sachin Kumar Garg a =C3=A9c=
rit=C2=A0:
> Add support for the MBR rate-control mode on the encoder.
> MBR has no corresponding V4L2-spec definition, it is exposed as a
> Qualcomm IRIS vendor-specific control rather than a generic
> bitrate-mode value.
>=20
> Add a new boolean control, V4L2_CID_QCOM_MBR_RATE_CONTROL, based on
> V4L2_CID_USER_QCOM_IRIS_BASE, to enable it. When set, the driver

Vendor specific does not mean undocumented. Please update the Documentation
folder with precise description. Upstreaming is about doing things right, i=
f you
want to secretly add feature, do this in your BSP.

We use vendor control when we don't have enough data to generalize. But
documentation should be sufficient to understand what the feature does and =
be
able to later enhance the control and generalize for other vendor / hardwar=
e. It
is in no mean an excuse for a vendor to ignore publicly available informati=
on
from other vendors or to hide details strictly needed by final users.

In this state, this is a NACK.

Nicolas

> programs the firmware with the MBR rate-control mode, taking priority
> over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.
>=20
> MBR is currently supported only on sc7280. Rather than duplicating
> the encoder capability table per platform, add a mbr_rc_supported
> flag to struct iris_platform_data, and merge in a small
> platform-specific capability table containing only the MBR cap for
> platforms that support it.
>=20
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++=
++----
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
>  7 files changed, 94 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/medi=
a/platform/qcom/iris/iris_ctrls.c
> index 4f2633bbb49f..626239952b96 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -163,6 +163,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id=
(u32 id)
>  		return SLICE_MAX_BYTES;
>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
>  		return SLICE_MAX_MB;
> +	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
> +		return MBR_RATE_CONTROL;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -314,6 +316,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap=
_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
>  	case SLICE_MAX_MB:
>  		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
> +	case MBR_RATE_CONTROL:
> +		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
>  	default:
>  		return 0;
>  	}
> @@ -352,6 +356,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops =3D =
{
>  	.s_ctrl =3D iris_op_s_ctrl,
>  };
> =20
> +static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config =
=3D {
> +	.ops =3D &iris_ctrl_ops,
> +	.id =3D V4L2_CID_QCOM_MBR_RATE_CONTROL,
> +	.name =3D "MBR Rate Control",
> +	.type =3D V4L2_CTRL_TYPE_BOOLEAN,
> +	.min =3D 0,
> +	.max =3D 1,
> +	.step =3D 1,
> +	.def =3D 0,
> +};
> +
>  int iris_ctrls_init(struct iris_inst *inst)
>  {
>  	struct platform_inst_fw_cap *cap =3D &inst->fw_caps[0];
> @@ -385,7 +400,11 @@ int iris_ctrls_init(struct iris_inst *inst)
>  			goto error;
>  		}
> =20
> -		if (cap[idx].flags & CAP_FLAG_MENU) {
> +		if (v4l2_id =3D=3D V4L2_CID_QCOM_MBR_RATE_CONTROL) {
> +			ctrl =3D v4l2_ctrl_new_custom(&inst->ctrl_handler,
> +						    &iris_mbr_rate_control_ctrl_config,
> +						    NULL);
> +		} else if (cap[idx].flags & CAP_FLAG_MENU) {
>  			ctrl =3D v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
>  						      &iris_ctrl_ops,
>  						      v4l2_id,
> @@ -428,6 +447,38 @@ int iris_ctrls_init(struct iris_inst *inst)
>  	return ret;
>  }
> =20
> +static const struct platform_inst_fw_cap inst_fw_cap_sc7280_only_enc[] =
=3D {
> +	{
> +		.cap_id =3D MBR_RATE_CONTROL,
> +		.min =3D 0,
> +		.max =3D 1,
> +		.step_or_mask =3D 1,
> +		.value =3D 0,
> +		.flags =3D CAP_FLAG_OUTPUT_PORT,
> +	},
> +};
> +
> +static void iris_copy_enc_caps(struct iris_core *core, const struct plat=
form_inst_fw_cap *caps,
> +			       u32 num_cap)
> +{
> +	u32 i, cap_id;
> +
> +	for (i =3D 0; i < num_cap; i++) {
> +		cap_id =3D caps[i].cap_id;
> +		if (!iris_valid_cap_id(cap_id))
> +			continue;
> +
> +		core->inst_fw_caps_enc[cap_id].cap_id =3D caps[i].cap_id;
> +		core->inst_fw_caps_enc[cap_id].min =3D caps[i].min;
> +		core->inst_fw_caps_enc[cap_id].max =3D caps[i].max;
> +		core->inst_fw_caps_enc[cap_id].step_or_mask =3D caps[i].step_or_mask;
> +		core->inst_fw_caps_enc[cap_id].value =3D caps[i].value;
> +		core->inst_fw_caps_enc[cap_id].flags =3D caps[i].flags;
> +		core->inst_fw_caps_enc[cap_id].hfi_id =3D caps[i].hfi_id;
> +		core->inst_fw_caps_enc[cap_id].set =3D caps[i].set;
> +	}
> +}
> +
>  void iris_session_init_caps(struct iris_core *core)
>  {
>  	const struct platform_inst_fw_cap *caps;
> @@ -461,23 +512,12 @@ void iris_session_init_caps(struct iris_core *core)
>  		}
>  	}
> =20
> -	caps =3D core->iris_firmware_data->inst_fw_caps_enc;
> -	num_cap =3D core->iris_firmware_data->inst_fw_caps_enc_size;
> +	iris_copy_enc_caps(core, core->iris_firmware_data->inst_fw_caps_enc,
> +			   core->iris_firmware_data->inst_fw_caps_enc_size);
> =20
> -	for (i =3D 0; i < num_cap; i++) {
> -		cap_id =3D caps[i].cap_id;
> -		if (!iris_valid_cap_id(cap_id))
> -			continue;
> -
> -		core->inst_fw_caps_enc[cap_id].cap_id =3D caps[i].cap_id;
> -		core->inst_fw_caps_enc[cap_id].min =3D caps[i].min;
> -		core->inst_fw_caps_enc[cap_id].max =3D caps[i].max;
> -		core->inst_fw_caps_enc[cap_id].step_or_mask =3D caps[i].step_or_mask;
> -		core->inst_fw_caps_enc[cap_id].value =3D caps[i].value;
> -		core->inst_fw_caps_enc[cap_id].flags =3D caps[i].flags;
> -		core->inst_fw_caps_enc[cap_id].hfi_id =3D caps[i].hfi_id;
> -		core->inst_fw_caps_enc[cap_id].set =3D caps[i].set;
> -	}
> +	if (core->iris_platform_data->mbr_rc_supported)
> +		iris_copy_enc_caps(core, inst_fw_cap_sc7280_only_enc,
> +				   ARRAY_SIZE(inst_fw_cap_sc7280_only_enc));
>  }
> =20
>  static u32 iris_get_port_info(struct iris_inst *inst,
> @@ -777,6 +817,27 @@ int iris_set_peak_bitrate(struct iris_inst *inst, en=
um platform_inst_fw_cap_type
>  				     &peak_bitrate, sizeof(u32));
>  }
> =20
> +static int iris_set_mbr_rate_control(struct iris_inst *inst, u32 rc_mode=
)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops =3D inst->hfi_session_ops;
> +	u32 hfi_id =3D inst->fw_caps[BITRATE_MODE].hfi_id;
> +
> +	inst->hfi_rc_type =3D rc_mode;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, BITRATE_MODE),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &rc_mode, sizeof(u32));
> +}
> +
> +static bool iris_mbr_rate_control_enabled(struct iris_inst *inst)
> +{
> +	/* MBR_RATE_CONTROL takes priority over BITRATE_MODE when both are clie=
nt-set */
> +	return (inst->fw_caps[MBR_RATE_CONTROL].flags & CAP_FLAG_CLIENT_SET) &&
> +		inst->fw_caps[MBR_RATE_CONTROL].value;
> +}
> +
>  int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_ins=
t_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops =3D inst->hfi_session_ops;
> @@ -786,6 +847,9 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst=
, enum platform_inst_fw_cap
>  	u32 hfi_id =3D inst->fw_caps[cap_id].hfi_id;
>  	u32 rc_mode =3D 0;
> =20
> +	if (iris_mbr_rate_control_enabled(inst))
> +		return iris_set_mbr_rate_control(inst, HFI_RATE_CONTROL_MBR);
> +
>  	if (!frame_rc)
>  		rc_mode =3D HFI_RATE_CONTROL_OFF;
>  	else if (bitrate_mode =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
> @@ -813,6 +877,9 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst=
, enum platform_inst_fw_cap
>  	u32 hfi_id =3D inst->fw_caps[cap_id].hfi_id;
>  	u32 rc_mode =3D 0;
> =20
> +	if (iris_mbr_rate_control_enabled(inst))
> +		return iris_set_mbr_rate_control(inst, HFI_RC_MBR);
> +
>  	if (!frame_rc)
>  		rc_mode =3D HFI_RC_OFF;
>  	else if (bitrate_mode =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/medi=
a/platform/qcom/iris/iris_ctrls.h
> index 08db80744420..a170ef33a0ac 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -6,8 +6,12 @@
>  #ifndef __IRIS_CTRLS_H__
>  #define __IRIS_CTRLS_H__
> =20
> +#include <linux/videodev2.h>
> +
>  #include "iris_platform_common.h"
> =20
> +#define V4L2_CID_QCOM_MBR_RATE_CONTROL (V4L2_CID_USER_QCOM_IRIS_BASE + 0=
)
> +
>  struct iris_core;
>  struct iris_inst;
> =20
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 47e9147a9b6d..50d38fe89792 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -621,6 +621,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_=
session_set_property_pkt *p
>  		case HFI_RATE_CONTROL_VBR_CFR:
>  		case HFI_RATE_CONTROL_VBR_VFR:
>  		case HFI_RATE_CONTROL_CQ:
> +		case HFI_RATE_CONTROL_MBR:
>  			break;
>  		default:
>  			return -EINVAL;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 6981e6e84fd8..33c238a1c9bb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -132,6 +132,7 @@
>  #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
>  #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
>  #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
> +#define HFI_RATE_CONTROL_MBR			0x1000006
>  #define HFI_RATE_CONTROL_CQ				0x1000008
> =20
>  #define HFI_H264_ENTROPY_CAVLC			0x1
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 2b8b057d35a9..cac2f3225754 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -64,6 +64,7 @@ enum hfi_rate_control {
>  	HFI_RC_OFF		=3D 0x00000003,
>  	HFI_RC_CBR_VFR		=3D 0x00000004,
>  	HFI_RC_LOSSLESS		=3D 0x00000005,
> +	HFI_RC_MBR		=3D 0x00000006,
>  };
> =20
>  #define HFI_PROP_RATE_CONTROL			0x0300012a
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/dr=
ivers/media/platform/qcom/iris/iris_platform_common.h
> index cddab9a9c375..c150dbb559f0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -211,6 +211,7 @@ enum platform_inst_fw_cap_type {
>  	SLICE_MODE,
>  	SLICE_MAX_BYTES,
>  	SLICE_MAX_MB,
> +	MBR_RATE_CONTROL,
>  	INST_FW_CAP_MAX,
>  };
> =20
> @@ -348,6 +349,7 @@ struct iris_platform_data {
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	bool no_rpmh;
> +	bool mbr_rc_supported;
>  	u32 wd_intr_mask;
>  	u32 icc_ib_multiplier;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/driv=
ers/media/platform/qcom/iris/iris_platform_vpu2.c
> index becbe3776544..35a5c42c6ab7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -132,6 +132,7 @@ const struct iris_platform_data sc7280_data =3D {
>  	.tz_cp_config_data_size =3D ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe =3D 1,
>  	.no_aon =3D true,
> +	.mbr_rc_supported =3D true,
>  	.wd_intr_mask =3D WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.icc_ib_multiplier =3D 1,
>  	.max_session_count =3D 16,

--=-BPrxVElHcDLqlHohuXML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaukphAAKCRDZQZRRKWBy
9OAdAP9fU4Imx9fLIj3vQqqg1J44qiQLcwFPR6S9BisaCmI0BAEAnfwo4/r+XbKF
BPI2YTrK8eP2y6HpN9ioQ93MhGuMzg8=
=2QRW
-----END PGP SIGNATURE-----

--=-BPrxVElHcDLqlHohuXML--
