Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A3A4766A5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369627; cv=none; b=OxmI4BM0vgnEmUyrDthBebiEMbyAjHa8h1CL2yTCa5lairTflrWjJzD38pIdFk/OQLkBqKzO7flQ39JX5Da823oueYMlH+tsXemOOE0OHwVETpy7S1Hot0/6lVbuMUG8kNNvOe9zs6OTaIWnSqn0T0cTfwd/6OnGneo16LDMhoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369627; c=relaxed/simple;
	bh=FDzcKVus+TL3O3kjbTF5oZn+yi6hvjNayEw4B6qJCCI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=owrBCIibMmS8gi9WxhV6fWVaiEI+DXcnI7VyUScHF2eti3FKCzYBpxIl+niYITjGjghVHCs/T5hABMVG38mWA+kblyOoozlycRXgtXqs8KIz931U2GKHCb4dtRtrvf4C+LyCNvkvfg1Zg2wRSbCZwbf/X3rM8QF1DTSRAm9a5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TtojSPvN; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TtojSPvN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FDzcKVus+TL3O3kjbTF5oZn+yi6hvjNayEw4B6qJCCI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791369591; v=1; x=1791974391;
 b=TtojSPvN55Xv02KX4u6XAQA8RaPa0tqu9R59D2Tw8vA8P7wKkMOD1Ks0yTifl1sEHc8GpnXl
 Az5/KC0CzOlWzaq9k3E6MUzDkMbPL8y5UqojkYUq7Mm6crdQPw+3I4X8HY3d/NWPq+E0i1cT5E6
 mKrB6PYTOlRZ46UJJaYBIois=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2512af27f42dab7f;
	Wed, 07 Oct 2026 10:39:51 +0000
X-Mizu-Trace-ID: 2512af27f42dab7f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 07 Oct 2026 16:09:43 +0530
From: Aditya Garg <aditya.garg@linux.dev>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Lukas Wunner <lukas@wunner.de>,
 Alex Deucher <alexdeucher@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, "Perlow, Jason" <jperlow@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] PCI/AER: MacBookPro16,1 powers off ~20 s after boot
User-Agent: Thunderbird for Android
In-Reply-To: <8925d288-a496-4fcc-9545-7647dfc9ea63@leemhuis.info>
References: <CABZrw2HcaOh3DHTJtxU5dXrb3Vg19scr6+qR-xe_+R7rME35_Q@mail.gmail.com> <20261005231914.GA639967@bhelgaas> <CADnq5_O2TWeWEE1NsuCVvtWLKWyOiJHChPGP9CN4Zu=hvs+jmA@mail.gmail.com> <asVlzjaUFAoowH-r@wunner.de> <8925d288-a496-4fcc-9545-7647dfc9ea63@leemhuis.info>
Message-ID: <F405BE2D-9C00-4E72-B5C4-BA2FD5348E84@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 7 October 2026 3:59:17=E2=80=AFpm IST, Thorsten Leemhuis <regressions@l=
eemhuis=2Einfo> wrote:
>On 10/6/26 23:19, Lukas Wunner wrote:
>> On Tue, Oct 06, 2026 at 12:37:18PM -0400, Alex Deucher wrote:
>>> On Mon, Oct 5, 2026 at 7:19 PM Bjorn Helgaas <helgaas@kernel=2Eorg> wr=
ote:
>>>> Alex reported something similar at
>>>> https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D222095=2E
>>>
>>> Lukas' patches fixes some boards, but unfortunately, I'm still seeing
>>> failures on others=2E  Reverting the patch fixes those failures=2E  I'=
ve
>>> updated the ticket=2E
>>=20
>> I've added an analysis of the dmesg output as well as a patch=2E
>> It looks like the BIOS is raising a false alarm in that it signals
>> a Fatal Error even though the Uncorrectable Error Status register is
>> blank=2E  The patch causes such events to be reported, but otherwise
>> ignored (i=2Ee=2E no recovery is attempted for a false alarm)=2E
>>=20
>> Newly enabled functionality like Advisory Non-Fatal Errors causes
>> BIOS code paths to be exercised which likely haven't been tested
>> by firmware validation folks, hence the fallout=2E  However I believe
>> ultimately we *want* to see those errors being reported because they
>> may point to BIOS issues which flew under the radar so far=2E
>Well, not disagreeing, but given that we have two regression reports
>(one speaking about multiple machines being broken) and we are close to
>-rc7 I wonder:
>
>Is this something we should quickly revert or disable for now and retry
>again later? Maybe multiple mainline devel cycles if needed?

I think the patch needs vigorous testing on a variety of hardware before b=
eing mainlined=2E For now a revert seems to be a good solution to ensure we=
 don't have a broken 7=2E3 for multiple devices=2E Also, we are close a new=
 LTS kernel, it's really not a good thing to have a broken one=2E
