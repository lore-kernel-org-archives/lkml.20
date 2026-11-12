Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502652;
	b=MH38ZA9dbCo/2S9py+aOHR9wPK/UKHFfmEGV8LoPwCfuDs7PwAmHo5BmL47aPsSCwl+m
	 sJSYE5A8IxB+GQ+VsKCgIx/6W7jknHn53N5MR5gl09wCntwQcCFDbadM+RXzMg0eBOjjN
	 yc+3xOioPCori/tKLLiBD0UlAe9TjDYQiJtcLB9inqDd0B/cUw9eHHyxyiHL+zIQUdiFf
	 xWI12QT0rwxPCL7fTcsjL001LWtrC2mdimg9Ewg9szxQSMnObsFA9KY+Nux4Iq5YWGw2m
	 OaMvFnXVxdSCsjLcGTDQoAqPhjtk8PkXbB1HB+rlOBzSMUnRziDl/g+MrSZZIk8COkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502652;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=9/cjPb17iS/vxrutTkad0O/nl3xuamRudtfiqpQy7hI=;
	b=os+jcWyIzpc/FoX5LZ/HzOg1h8szUnn0yMg6RJVS974VkQFV2wSM6llWkvjrhjiJyOLS
	 cMxX0nnE0myEw06woDWnbAtHuh8o46JD0luhkA6PshynEklimxh2Xw1OMwGgLK41VIjMz
	 tcf3U6jO3ciPj+Xw5RLb7UrTi2a2vI57IMlP2JaQTVHGAWl3YegO3j1tlxwibZ5xjpxx1
	 WCjpBq4/f79A1GryDfVdy/vUWcMAKwYiCRHRgWqly1cECEeQ4I+bcW0h7SqHAAuLA+p/5
	 DgPhbaid+kG+g3Aovl6ntMStFk7v413cUTodlxyvjnds2ZYp/+cBImWmcADR4QCQgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hTFTJsP6;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD68606A321;
	Thu, 12 Nov 2026 16:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hTFTJsP6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794502649;
	bh=EXQNV0uzu+d14uonYm2DSA/v23rPeVgADO5iLS6qa7w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hTFTJsP6c3bIKhj5x8jjAyKny9sgXSoqpXMycdTe96Z5pKsdmsO2U5QtDy0Zbhfee
	 x5DGqLhRCo5xQdq6JwSUKQ+j60WZ0juV3jzCzblv/z5CrBosVQUslGeUPwm6gJ8nKh
	 nbqemi5RDVZkJV7L18aa+I0WGTLsH6skw4ye9b0SHPUj6jz4gIitznZoK4tAuo1LOu
	 b82KsSrV8hE3UBJFvdE31n24fmlY3UqmN+63lWdYy6T7n1vKmlqsz8uie3rhsTUE0m
	 X8nKXVwl1JRkZwRfx6JA4aDwIdgex8eyfEqOFow6KX6NXsxgxIsaeOdVM3nSn6EkOd
	 oZ5L0j3D7uo3g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02CD717E080A;
	Thu, 12 Nov 2026 17:57:27 +0100 (CET)
Message-ID: <b2999c2fe5193eac3ebb0796f3de44710e993200.camel@collabora.com>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for S4
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:57:26 -0500
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4Pee9qjTAWQLJCV3w4xl"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-4Pee9qjTAWQLJCV3w4xl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 22 octobre 2026 =C3=A0 13:26 +0800, Zhentao Guo via B4 Relay a =C3=
=A9crit=C2=A0:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
>=20
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
>=20
> The driver needs to work alongside with a signed firmware. The loading pr=
ocess of
> the signed fw is as follow.
> Stage1: Decypt and decompose the full firmware package when the driver is=
 probed.
>   +---------------------+                        +---------------------+
>   |  Decoder Driver     |                        |  TEE Shared Memory  |
>   |  (Kernel Space)     |                        |                     |
>   |  +---------------+  |                        |  +---------------+  |
>   |  | video_ucode   |  |                        |  | firmware      |  |
>   |  |    .bin       |  |  Copy payload to SHM   |  |   payload     |  |
>   |  | (from fs)     |  | ---------------------> |  | (Secure RAM)  |  |
>   |  +---------------+  |                        |  +---------------+  |
>   +---------------------+                        +----------+----------+
>                                                             |
>                                                             | PTA Invocat=
ion
>                                                             v
>                                        +-------------------------------+
>                                        |             BL32              |
>                                        |  +-------------------------+  |
>                                        |  | Decrypt Firmware        |  |
>                                        |  +-----------+-------------+  |
>                                        |              |                |
>                                        |              v                |
>                                        |  +-------------------------+  |
>                                        |  | Decompose the full      |  |
> =09=09=09=09       |  | firmware pacakge        |  |
>                                        |  +-----------+-------------+  |
>                                        |              |                |
>                                        |              v                |
>                                        |  +-------------------------+  |
>                                        |  | Store decomposed .bin   |  |
>                                        |  | in Secure Memory        |  |
>                                        |  +-------------------------+  |
>                                        +-------------------------------+
>=20
> Stage2: When a decode job is scheduled, load decrypted fw via secure moni=
tor.
>=20
>   +---------------------+
>   |  V4L2 M2M Framework |
>   |  +---------------+  |
>   |  |  device_run   |  |
>   |  +------+--------+  |
>   +---------+-----------+
>             |
>             v
>   +---------------------+                  +---------------------+
>   |  Decoder Driver     |                  |  Secure Monitor     |
>   |  (Kernel Space)     |                  |      (bl32)         |
>   |  +---------------+  |     SMC Call     |  +---------------+  |
>   |  | Select Codec  |  | ---------------> |  | Select & Load |  |
>   |  | Specific FW   |  |                  |  | firmware.bin  |  |
>   |  +---------------+  |                  |  | to AMRISC     |  |
>   +---------------------+                  |  +-------+-------+  |
>                                            +----------+----------+
>                                                       |
>                                                       v
>                                            +---------------------+
>                                            |     AMRISC Core     |
>                                            |  +---------------+  |
>                                            |  | Running fw on |  |
>                                            |  | AMRISC        |  |
>                                            |  +---------------+  |
>                                            +---------------------+
>=20
> The driver is capable of:
> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on the=
 S805X2 platform).
> - Supporting I/P/B frame handling.
> - Supporting vb2 mmap and dma-buf modes.
> - Supporting frame-based decode mode. (Note that some H.264 bitstreams re=
quire
>   DPB reordering to generate reference lists, the stateless decoder drive=
r
>   cannot access reordered reference lists in this mode, requiring the dri=
ver
>   to perform reference list reordering itself)
> - Supporting NV12/NV21 output.
> - Supporting Annex B start codes.
>=20
> This driver is tested with Gstreamer.
> Example:
> gst-launch-1.0 filesrc location=3D/tmp/video_640x360_mp4_hevc_450kbps_no_=
b.mp4 !
> parsebin ! v4l2slh264dec ! filesink location=3D/tmp/output.yuv
>=20
> Retry the compliance test based on kernel 7.1.0:
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>=20
> Compliance test for aml-vdec-drv device /dev/video0:
>=20
> Driver Info:
> Driver name : aml-vdec-drv
> Card type : platform:aml-vdec-drv
> Bus info : platform:fe320000.video-codec
> Driver version : 7.1.0
> Capabilities : 0x84204000
> Video Memory-to-Memory Multiplanar
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps : 0x04204000
> Video Memory-to-Memory Multiplanar
> Streaming
> Extended Pix Format
> Detected Stateless Decoder
> Media Driver Info:
> Driver name : aml-vdec-drv
> Model : aml-vdec-drv
> Serial :
> Bus info : platform:fe320000.video-codec
> Media version : 7.1.0
> Hardware revision: 0x00000000 (0)
> Driver version : 7.1.0
> Interface Info:
> ID : 0x0300000c
> Type : V4L Video
> Entity Info:
> ID : 0x00000001 (1)
> Name : aml_dev_drv-source
> Function : V4L2 I/O
> Pad 0x01000002 : 0: Source
> Link 0x02000008: to remote pad 0x1000004 of entity 'aml_dev_drv-proc' (Vi=
deo Decoder): Data, Enabled, Immutable
>=20
> Required ioctls:
> test MC information (see 'Media Driver Info' above): OK
> test VIDIOC_QUERYCAP: OK
> test invalid ioctls: OK
>=20
> Allow for multiple opens:
> test second /dev/video0 open: OK
> test VIDIOC_QUERYCAP: OK
> test VIDIOC_G/S_PRIORITY: OK
> test for unlimited opens: OK
>=20
> Debug ioctls:
> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> test VIDIOC_ENUMAUDIO: OK (Not Supported)
> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> test VIDIOC_G/S_AUDIO: OK (Not Supported)
> Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> test VIDIOC_QUERYCTRL: OK
> test VIDIOC_G/S_CTRL: OK
> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> Standard Controls: 6 Private Controls: 0
> Standard Compound Controls: 4 Private Compound Controls: 0
>=20
> Format ioctls:
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> test VIDIOC_G/S_PARM: OK (Not Supported)
> test VIDIOC_G_FBUF: OK (Not Supported)
> test VIDIOC_G_FMT: OK
> test VIDIOC_TRY_FMT: OK
> test VIDIOC_S_FMT: OK
> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> test Cropping: OK (Not Supported)
> test Composing: OK (Not Supported)
> test Scaling: OK (Not Supported)
>=20
> Codec ioctls:
> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> test VIDIOC_(TRY_)DECODER_CMD: OK
>=20
> Buffer ioctls:
> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> test CREATE_BUFS maximum buffers: OK
> test VIDIOC_REMOVE_BUFS: OK
> test VIDIOC_EXPBUF: OK
> test Requests: OK
> test blocking wait: OK
>=20
> Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, Failed: 0, =
Warnings: 0
> Fluster test result of JVT-AVC_V1.
> Result:
> Ran 77/135 tests successfully

After looking in my past data, 90/135 would be expected without deinterlace=
r. I
already find bugs in the review, comment on that patches.

>=20
> - 52 test vectors failed due to interlaced or mbaff clips: The Amlogic st=
ateless
>   decoder driver only support bitstreams with frame_mbs_only_flags =3D=3D=
 1.
>   Test Vectors:
>         cabac_mot_fld0_full
>         cabac_mot_mbaff0_full
>         cabac_mot_picaff0_full
>         CABREF3_Sand_D
>         CAFI1_SVA_C
>         CAMA1_Sony_C

I don't know them all, but at least this one, and CVMA1_Sony_D do not conta=
in
field coded macroblocks, and should decode fine without the interlaced refe=
rence
list. We've seen a lot of artifically limited decoder like yours output 90/=
135.

>         CAMA1_TOSHIBA_B
>         cama1_vtc_c
>         cama2_vtc_b
>         CAMA3_Sand_E
>         cama3_vtc_b
>         CAMACI3_Sony_C
>         CAMANL1_TOSHIBA_B
>         CAMANL2_TOSHIBA_B
>         CAMANL3_Sand_E
>         CAMASL3_Sony_B
>         CAMP_MOT_MBAFF_L30
>         CAMP_MOT_MBAFF_L31
>         CANLMA2_Sony_C
>         CANLMA3_Sony_C
>         CAPA1_TOSHIBA_B
>         CAPAMA3_Sand_F
>         cavlc_mot_fld0_full_B
>         cavlc_mot_mbaff0_full_B
>         cavlc_mot_picaff0_full_B
>         CVCANLMA2_Sony_C
>         CVFI1_Sony_D
>         CVFI1_SVA_C
>         CVFI2_Sony_H
>         CVFI2_SVA_C
>         CVMA1_Sony_D
>         CVMA1_TOSHIBA_B
>         CVMANL1_TOSHIBA_B
>         CVMANL2_TOSHIBA_B
>         CVMAPAQP3_Sony_E
>         CVMAQP2_Sony_G
>         CVMAQP3_Sony_D
>         CVMP_MOT_FLD_L30_B
>         CVNLFI1_Sony_C
>         CVNLFI2_Sony_H
>         CVPA1_TOSHIBA_B
>         FI1_Sony_E
>         MR6_BT_B
>         MR7_BT_B
>         MR8_BT_B
>         MR9_BT_B
>         Sharp_MP_Field_1_B
>         Sharp_MP_Field_2_B
>         Sharp_MP_Field_3_B
>         Sharp_MP_PAFF_1r2
>         Sharp_MP_PAFF_2r
>         CVMP_MOT_FRM_L31_B
> - 3 test vectors failed due to unsupported bitstream.
>   num_slice_group_minus1 greater than zero is not supported by the
>   hardware.
>   Test Vectors:
>         FM1_BT_B
>         FM1_FT_E
>         FM2_SVA_C
> - 2 test vectors failed because SP_SLICE type is not supported by the
>   hardware.
>   Test Vectors:
>         SP1_BT_A
>         sp2_bt_b
>=20
> One remain failure is CVFC1_Sony_C, which contains crop information. The =
md5sum of every decoded YUV indicates that original output from the decoder=
 was correct. The YUV was cropped by gstreamer. The correct cropping method=
 for this bitstream should be to crop 30*2 rows of pixels from both the top=
 and bottom of the image, and 13*2 columns of pixels from both the left and=
 right sides.However, gstreamer cropped 13*4 columns of pixels from the rig=
ht side and 30*4 rows of pixels from the bottom. We are trying to find out =
the cause of this. Other failuers mentioned in V1 and V2 were resolved.
>=20

Would be nice to report this bug.

> Changes in v12:
> - Add additional check to avoid the resolution happened in middle of a bi=
tstream without streamon/off, due to the non-standard habbit of the userspa=
ce.
> - Add a separate initialization claim, init_ctx, to protect the hardware =
initialization process.
> - Add rejection to the formats whose type does not match the queue in all=
 four s_fmt/try_fmt paths.
> - Link to v11: https://lore.kernel.org/r/20261012-b4-s4-vdec-upstream-v11=
-0-25939f85ada5@amlogic.com
>=20
> Changes in v11:
> - Check clock/power-on failures before operating the registers. Use pm_ru=
ntime_resume_and_get() instead of pm_runtime_get_sync() so the usage counte=
r stays balanced on the error path.
> - Fix missing validation of untrusted bitstream input in the H.264 decode=
r.
> - Fix instance/resource lifetime issues: do not re-init a live decoder in=
stance when only output or capture queue restarts.
> - Link to v10: https://lore.kernel.org/r/20260924-b4-s4-vdec-upstream-v10=
-0-1289303a58a4@amlogic.com
>=20
> Changes in v10:
> - Rename the clock/power/interrupt names in dt-binding and dts to match t=
he name of decoder sub-core (dos, vdec, hvdec).
> - Fix the h264 high profile bitstreams decoding error issue.
> - Use the allocation bitmaps instead of poc !=3D INVALID_POC as the slot =
occupancy test, since INVALID_POC (0xffffffff) aliases with the valid POC v=
alue -1.
> - Link to v9: https://lore.kernel.org/r/20260914-b4-s4-vdec-upstream-v9-0=
-72fdb0d71b02@amlogic.com
>=20
> Changes in v9:
> - Rename the clock/power/interrupt names in dt-binding and dts. Add the d=
escriptions to the clock items in dt-binding.
> - Optimized the handling process for reference frame loss. The address of=
 a lost reference frame will not be configured to the hardware, to prevent =
the hardware from accessing an illegal address.
> - Optimized the error handling paths in the driver based on v8.=20
> - Link to v8: https://lore.kernel.org/r/20260831-b4-s4-vdec-upstream-v8-0=
-830195b9bd91@amlogic.com
>=20
> Changes in v8:
> - Rename the clock/power names in dt-binding and dts. Add the description=
s to the canvas and secure-monitor node in dt-binding.
> - Improve code accroding to the feedback of sashiko bot, including:
>     1.Imporve the resource cleanup and error handling paths in the driver=
.
>     2.Mitigated race conditions between the decode path, interrupt handle=
r, and resource teardown.
>     3.Validate codec-stream parameters passed to the driver to prevent th=
e potential risk.
> - Link to v7: https://lore.kernel.org/r/20260812-b4-s4-vdec-upstream-v7-0=
-3fae085861bd@amlogic.com
>=20
> Changes in v7:
> - Addressed Krzysztof's review comments: fixed DTS coding style, added bo=
ard info requiring the config to patch 6/6's commit message.
> - Improvements made per sashiko bot review, including:
>     1.Fixed memory out-of-bounds access / buffer overflow issues.
>     2.Fixed concurrency and race conditions related issues.
>     3.Improved the error handling paths to avoid the risk of resource lea=
kage.
>     4.Fixed the improper V4L2 framework usage.
> - Link to v6: https://lore.kernel.org/r/20260724-b4-s4-vdec-upstream-v6-0=
-6072a7ee7428@amlogic.com
>=20
> Changes in v6:
> - Rename the HEVC core and the associated power, clock, and interrupt nam=
es. 'HEVC' was a development codename of the decoder IP which accelerates h=
265 vp9 av1 decoding, but it coincidentally matches the acronym for High Ef=
ficiency Video Coding. To avoid naming ambiguity, HEVC core is renamed to H=
VDEC core(H stands for HEVC).
> - Get rid of the unused function and interface.
> - Link to v5: https://lore.kernel.org/r/20260526-b4-s4-vdec-upstream-v5-0=
-33bc817f93f4@amlogic.com
>=20
> Changes in v5:
> - Rename the compatible and the clock item accroding to Krzysztof's feedb=
ack.
> - Use tee & meson_sm helpers to decrypt load the signed decoder firmware.=
 Add the meson_sm describsion and reference to dt-binding and dts.
> - Link to v4: https://lore.kernel.org/r/20260213-b4-s4-vdec-upstream-v4-0=
-c7112d00d662@amlogic.com
>=20
> Changes in v4:
> - Use %pad to print dma_addr_t type instead of using %llx.
> - Add initial values to some local variables.
> - Link to v3: https://lore.kernel.org/r/20260121-b4-s4-vdec-upstream-v3-0=
-4496aec3d79e@amlogic.com
>=20
> Changes in v3:
> - Fixed the DT check error:
>   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: video-codec@fe32=
0000 (amlogic,s4-vcodec-dec): 'amlogic,canvas' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'=20
>   from schema $id: http://devicetree.org/schemas/media/amlogic,vcodec-dec=
.yaml
> - Added DOS reset lines to dtsi and dt-binding.
> - Fixed the issue where some B-frames were not decoded correctly(The flus=
ter failures mentioned in patch V1 and V2 were mostly caused by this).
> - Fixed the issue where canvas_index leaks occurred during the decoding o=
f some bitstreams.
> - Rework the src/dst format storage. Use v4l2_pix_format_mplane to store =
formats that related to bitstreams into the context. Add the reset format f=
unction to reset all the formats to default value.=20
> - Store decoding parameters related to chip platforms, such as maximum wi=
dth/height and alignment requirement, organized by chip platform.
> - Link to v2: https://lore.kernel.org/r/20251124-b4-s4-vdec-upstream-v2-0=
-bdbbce3f11a6@amlogic.com
>=20
> Changes in v2:
> - Fixed incorrect generation of the reference lists for some B-frames.
> - Rename or get rid of some properties in DTS and dt-binding.
> - Remove some useless code or helper functions, (eg. clk helper functions=
, reg I/O macros, and some superfluous print messages) replace these functi=
ons with existing ones.
> - Replace all the printk messages with dev_err/dev_info/dev_dbg
> - Use the helper functions from the existing meson-canvas driver.
> - Use clk_bulk_data to map clocks from DTS.
> - Retry the V4L2 Compliance test on 6.18-rc6, fix a newly introduced bug.
> - Link to v1: https://lore.kernel.org/r/20251027-b4-s4-vdec-upstream-v1-0=
-620401813b5d@amlogic.com
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
> Zhentao Guo (6):
>       firmware: meson: sm: video firmware loading via secure monitor
>       firmware: meson: sm: Add video firmware loading SMC call
>       media: dt-bindings: Add Amlogic V4L2 video decoder
>       decoder: Add V4L2 stateless H.264 decoder driver
>       arm64: dts: amlogic: Add video decoder driver support for S4 SOCs
>       arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
>=20
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml |  114 +
>  MAINTAINERS                                        |    7 +
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   33 +
>  arch/arm64/configs/defconfig                       |    1 +
>  drivers/firmware/meson/meson_sm.c                  |    1 +
>  drivers/media/platform/amlogic/Kconfig             |    1 +
>  drivers/media/platform/amlogic/Makefile            |    1 +
>  drivers/media/platform/amlogic/vdec/Kconfig        |   18 +
>  drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>  drivers/media/platform/amlogic/vdec/TODO           |    7 +
>  drivers/media/platform/amlogic/vdec/aml_vdec.c     |  846 ++++++++
>  drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
>  drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  260 +++
>  drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  168 ++
>  drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  570 +++++
>  drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  161 ++
>  .../platform/amlogic/vdec/aml_vdec_platform.c      |   81 +
>  .../platform/amlogic/vdec/aml_vdec_platform.h      |   46 +
>  .../media/platform/amlogic/vdec/aml_vdec_tee_fw.c  |  249 +++
>  .../media/platform/amlogic/vdec/aml_vdec_tee_fw.h  |   27 +
>  drivers/media/platform/amlogic/vdec/h264.c         | 2209 ++++++++++++++=
++++++
>  drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
>  drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>  include/linux/firmware/meson/meson_sm.h            |    1 +
>  24 files changed, 5314 insertions(+)
> ---
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
>=20
> Best regards,

--=-4Pee9qjTAWQLJCV3w4xl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavXv9gAKCRDZQZRRKWBy
9FBYAP9AAl8zBEMYKyc4/kRqSI8cTVQd3t0Sd00auaPRum7QHgEAgyV46zjVdMTO
hsVePTlAbiqRmYrvbwwIcu9+jr2e6gk=
=6z1s
-----END PGP SIGNATURE-----

--=-4Pee9qjTAWQLJCV3w4xl--
