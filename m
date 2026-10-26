Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793012904;
	b=zYRMGRZBmqjZ1qppj+8a3cwJPSncbLeaTDyHraBX9xavHm+OP2pYY1YDEafPvA2HerGR
	 DCx5Z0Xq5EMKRTQvA06Ch522XN3pV6lXbpf6tfpPOWMSjLSrgwnXSF7VUhGZuRBLstwxP
	 jnB1G2gqK9Mvgue41cgCk7ERi2wTGvs9AKmBttM30LJm0nMeGQjxbU/+t+USiMkjVLE85
	 I2+MdDAeLeA2eGvQ7+uQDzLZLz6XyPISRhC6legRtMgKt7JIaz9lDIcff044X9nwZevz8
	 SETWGtK/CzH3uZLBG+ys8EedHL/TItv6BhDjszHNGOmxUAtcb6zNtSOe8boMgFdEsAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
	b=rt2ieTAesi6cnblyNQxJrnJDzPUVnJad2wK/Tvh9pe72wVHiBq9h7I37LwfvgMmm470+
	 tkTYqvM+Vy+LrhW2kKW04MaGJiY3oCqNXUPYiDw2/xzgu1wxFd9ImLOkhc41tuG7Q3zmi
	 sHMt/hPVuy0hcDBqrpTK1/omb+1XWI9XF9qPKXTCvOCVZukewLFBdVV+6jmCuUXXAdae5
	 h6H3YFgtKdXOZa50t6G3H+CvHyYakd/6clw/fyqnKb3AZAJoV4661za6vKbFmCd3J6w1K
	 2TdsKtraf68NgGsF2jHmo+0ONEmtsXJ5/1PT3OqWLPyFzriNewlh6l0pSFP8hZFI1Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kONUb3Ja;
	arc=fail smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1185606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1185606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kONUb3Ja
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ac4806e210so20651007b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012903; cv=none;
        d=google.com; s=arc-20260327;
        b=RUk6gNSUdG6bPTeQwB0YTuruyKd3zxqpoRjzaXmUeW7XZw3StjIoS5k7LFGoUktK8s
         SOA9j/HyoP2Nr11+c+DNjp5QN3bYJWLRzNg+hYkcOik6OZBD0IOyzaHRQ4+Iwq0WAfoR
         7/2bkTNoWOg5Xh7zOIdvGhF64PP6iu2GsZexsU9V6VP5e1EHHAYZiUi136iesgWhgzmF
         7zpohEOVBatal8kobJQ9YyFbndjBdDhaJQBa8Zh77LeR+3OjPBTB379DwWSBblIPqfTD
         dCmfenktcx+ja8zBGvTHrvlWFniAtLRfNwmQNZ9LX/0Or6ABlXgC6LL5+q3TOl2MGFov
         OTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        fh=e54mGbGLt02sTzTUW6b6npBuohZ18Bc9IC27p0rE2Qc=;
        b=Z4uM/hLoMkpsVBCZuBIGLdf8nckaRsxHQMos6R5Y+NKtGdzz0P0Be68VcZrtG9LqoA
         4CUvvXa3EzLED1XvqUwT5A4DaxPXzJ7pFjLfG9kuXZ30X/iYZbQdPO/HNNWV0aka2EWC
         gdUyndqUDEaGu0zuM6tjBL8JTZnkIeRWA/ikMyHiBLP1pOVwiV/IE0MjT0AbUBvpk6d1
         ofqT+p/8Kj5BPk2iLxKv6w+vkWqV29w9YC4hJZLxkppHVzkpW8kMO/jObUaOmKS7IIh1
         ud8R7lB9W9MHH8adsiEoaf/HLLJ8p8YL5ruS89nFRDHk09Llis0E+U1xQbE5uZKiggg/
         hgdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012903; x=1793617703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=kONUb3JaBAK8wTQDInDU2XWgyO/RAsHotSFSI+dVDyPZpSonRhgJrEBKOOJB0f/ACS
         GjuNp5TuITi8doe5+QUFouuGQMFX9KUmABCWw3a5061DJqSb4XaTr3slwiAGm7qFM2B6
         /HSRoilJ6rXUrydteijSi/P/hAGJWxp4VgHULYhcJnF0cXnQEFxl4FSy5N36o3+R+E/w
         bq5bhMruoyTlRYFBEoIjzGJQDxAIgXMkX6QAPPWFDrZskRhMmoGWXvegbA2wSlcrPfkk
         b9vSvK1GhSHnCSjfXCCSwd6uui2pzeXPvCUNOOG4s7TwwSnHN1gLxtrFEszwQk81LfP1
         9KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012903; x=1793617703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=tXJJJniv6czmsZiih/doREFkZpjGcvp5hePM4XBn5B0Da/sBg6grl+Ypf7Qxc20gWO
         Ga/eH8m9UXgOPW8Y3u2ni3HNa8NJspa8NeKwT0ldN2JWJbrKXvUKWgArg+dS0JzDLrsy
         0zdH0Sx2OYEaT0rJtemOufMIWz3TMn62SGmjcimHtJc6PrhTKVw1q75sYse0whlCjwvd
         AYP3w7nm4wXSLkDRwvWCk0XMYstxffaXAXYYkBezPTj9p1JwVWCpRNftt9LFgoEx5VCo
         SvonaoFzgRSGQngNqcsVIbXIWfYYlitRMJJdDjsu7kRw2iMn3h5rNnx5cisDw4GoUxKC
         LaGg==
X-Forwarded-Encrypted: i=1; AKwUvBzz07NYXAt0GTGEeuajKWHf2lRs5XrPYI6EgiSXIRkUgVnYDYtG0rtZ/3Vs3Z8y9ZG1uefNuCxXPT9eO64=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCjc5yqhhMVZg9F1jedMCs6RIA3yiJ+T7NcYJkX1c9Dkh9ehJ2
	VR1OpXh153AwZw2JdfRgXanr8oOs9Cnep8t+eHo9nXjXN8/qJL9gWnHw8DeITXYEgov7wapKTbP
	aSbatNaUfmUWdiaRqNOR1ZjG6rTofpp8=
X-Gm-Gg: AYBFou3en1xS485POcio1fjkEfZaeVALRJSNRfaCJ+bC/9IT7XFShEc+rFEnvn6wyGg
	6P0qlZNsU1QktFUVoGtCtXpzSP9kWQC9lk1NTe342CGAnBFlk0OBmadXNLDh+4YO6Rosy9U/R/z
	/ht6BobfJs3usUMSlgGimMSyB9cm9sZxS7xeFK9tXI0JlJIFJc6Kr5nWKs9GPlP9gNj2CdWoV0N
	Sob0DANNIBoWVXVt/DXAV5He1RdVEcvZExuhQKPGaT30HbEKXBscrlOFcdicwibpbc3poaZlPqg
	MkrrrTM2S1bY73IIslx3XcBIDrhdBKVY+4VPl1+yvSUC2GD1SMSoZL8mdaGc/DwF6eFjGsg/+CA
	C9fzbEbFE4vY/mY00r4lZtCLDPXpyhRYYtsH5hw==
X-Received: by 2002:a05:690c:c50e:b0:8aa:148:7706 with SMTP id
 00721157ae682-8b1669caf65mr45460507b3.8.1793012902608; Mon, 26 Oct 2026
 04:08:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
In-Reply-To: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 16:38:11 +0530
X-Gm-Features: AclHuK8Cpr6C86Ogdt3iNPcZespgzJH98h_TGBqL0O48_bvZRHN6DW3ckIu6Ds0
Message-ID: <CAMFFDGgygzu3OdFkq6+ztZOzaFMMTdYFqtkvmOtHNovQvabXQA@mail.gmail.com>
Subject: Re: [OpenBMC] Guidance on Getting Started with OpenBMC and Choosing a
 Development Board
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
	andrew@codeconstruct.com.au, changhuang.liang@starfivetech.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Mukesh Rathor <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandra Winter <wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, 
	Karthikeyan KS <karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kavya,

Thanks for sharing your platform details and starting a separate thread.

I am also Working On OpenBMC through ASRock Rack B650D4U enablement.
My work is still in progress, and I have not worked on the Gigabyte
MZ32-AR0 or evaluated development boards within your budget, so I
cannot recommend a specific platform confidently.

For the vendor-restricted shell, I would suggest contacting Gigabyte
support about supported debugging access and recovery procedures.

My practical recovery experience is limited to the ASRock Rack B650D4U
that I am currently working on. I use a CH341A external SPI flash
programmer for BMC firmware recovery.

I have not worked on the Gigabyte MZ32-AR0, so I cannot confirm its
recovery procedure or programmer compatibility. Please verify the
flash device, required voltage, and board-specific recovery
instructions before attempting external programming.

On Mon, Oct 26, 2026 at 4:07=E2=80=AFPM KAVYA M M <kavyamadarsh@gmail.com> =
wrote:
>
> Hello OpenBMC Team,
>
> I am new to OpenBMC development and would appreciate your guidance on get=
ting started with developing and validating an OpenBMC image for a server p=
latform.
>
> I have a few general questions:
>
> 1. What hardware documentation is normally required to develop a reliable=
 OpenBMC image for a new motherboard? Are the user manual and BMC reference=
 schematic sufficient, or are the complete motherboard schematic and board-=
specific signal mappings essential?
> 2. If the original BMC firmware is available only as a binary and the mot=
herboard schematic is unavailable, what is the recommended approach for ide=
ntifying the hardware configuration and developing the initial image?
> 3. Which existing OpenBMC reference platforms are suitable for beginners =
who want to learn the Yocto/BitBake build system, device trees, machine con=
figuration, sensor integration, and required services?
> 4. Which hardware platforms provide good support for testing sensor monit=
oring, fan PWM/tachometer control, Redfish, GPIO, host power control, and p=
ower sequencing?
> 5. Which functions can be tested in QEMU, and what hardware documentation=
 and recovery facilities are necessary before proceeding with physical-boar=
d testing?
>
> Request for Guidance on Restricted BMC SSH Access
>
> I would also like to understand how to access the underlying Linux shell =
on a BMC when SSH access is restricted by the vendor firmware.
>
> For example, some BMCs provide SSH access but expose only a restricted in=
terface, such as SMASH-CLP, instead of a standard Linux shell. In such case=
s, what is the recommended and authorized method for accessing the underlyi=
ng Linux environment for debugging, inspecting system configuration, and un=
derstanding the running services?
>
> Are there standard OpenBMC debugging methods or configuration options for=
 enabling SSH shell access during development? If access is restricted by t=
he vendor firmware, what documentation or permissions would be required to =
investigate this further?
>
> My current hardware
>
> I currently have access to a Gigabyte MZ32-AR0-00 motherboard with an ASP=
EED AST2500 BMC.
>
> I am considering using this board for my OpenBMC development. However, I =
do not have access to the complete motherboard schematic, and some board-sp=
ecific hardware mappings are difficult to confirm from the available docume=
ntation and original vendor firmware.
>
> I would appreciate your advice on whether this is a suitable platform for=
 learning and developing OpenBMC, or whether a different, better-documented=
 development platform would be a more practical starting point.
>
> Request for development-board recommendations
>
> My budget for purchasing a BMC development board is approximately =E2=82=
=B95,000=E2=80=93=E2=82=B910,000.
>
> Could you recommend a specific development board or server motherboard th=
at is affordable, well documented, and preferably has an existing upstream =
OpenBMC machine configuration?
>
> Ideally, I would like a platform that supports learning and testing:
>
> - OpenBMC image building using Yocto/BitBake.
> - Hardware sensor monitoring and integration.
> - Fan PWM/tachometer control and cooling failsafe behavior.
> - Redfish and other BMC management interfaces.
> - GPIO, host power control, and power sequencing.
> - QEMU-based software testing followed by physical-board validation.
>
> My preference is for a platform with an existing reference implementation=
, accessible hardware documentation, and a reliable firmware recovery metho=
d. Used development boards or server motherboards would also be suitable if=
 they are available within my budget.
>
> My goal is to choose the most practical platform, build and validate an i=
nitial OpenBMC image, and gradually learn the hardware integration process =
before attempting to flash a physical BMC.
>
> I would be grateful for any recommendations on suitable hardware, existin=
g reference platforms, documentation, or practical guidance from developers=
 experienced in OpenBMC platform development.
>
> Thank you for your time and support.
>
> Best regards,
> Kavya M M
