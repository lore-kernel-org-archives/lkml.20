Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696961;
	b=kjMmPwpX4i2r/Jf6B6UD6FgtR/IqE30dt0GTdAgr/JAOTWjO6qikFnnuRmhuHnpE9tIN
	 IMNlKwy1JEBm7JUcg30UjPm7yL/Ltobp/kKaK94+aF+cDuijdTTmjhsT8wUR0o+ttXo4e
	 MCeN7MTMmCfZkmV8kZkKIOPcAivKDcgHi2ySCiGb9HFjF354hXvHeyHJiBsogzYar7qGi
	 dAcQ8YCoW1qNFamfP3Vvkxw8VgcFFO7fuRCq4vaw//VF9m2yBg1QvCrPUgtJ8CB/S1aMP
	 Z97J2XzkL1YPl0sK3hcMOP9rQe8lvtUahE7EidNKNARf4z87kShWN5HZvLLAZMzdUSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696961;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BBTr+Hy0VdRQdkWFNF6C19CVLgiwmF8bx5L98QPeRao=;
	b=ve4FKvZAipOqaPrnnvaH9PWA7UJUdIPLHmlvrOJTcB/379Yc0oCXMW99MEKUTOcHzTVI
	 MgjJxsoBWHAvTiqSb/PipyyrM1jci7tMPdIXsVZlZ3krGjFu4xfPmz1EXft5dPSbBDIgh
	 71DIwO79s9Jv8yrlahl89V8sHuS51YmRJuZ1AAhPqaAB/ZsavXmsq236cwtsRTkpqhYvK
	 i/0gZPNolQtuxluav9ZMncLLh7m0AABmryL4v6lAdyfxm4UN7MIYPz97i53K4/PT/cI56
	 waHx8pslX4XFoXS8LT4odsUJLHbN4KM4fRikjJfiJ/0E/VHqUlmTcOjmsL9898sef0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rd1HG7b8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 163D5606A32D;
	Tue,  3 Nov 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rd1HG7b8
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ADD0D1F000C1;
	Tue,  3 Nov 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696960;
	bh=BBTr+Hy0VdRQdkWFNF6C19CVLgiwmF8bx5L98QPeRao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rd1HG7b8vKZe3wL/ox7VTzKhvRkMIgOpQtaCq81EvltYUAtmuBG5zKgISB7rB6jWN
	 82ubsJlxEMAeI8hSK/O6entOhlOIlmwyhzbJrRTKO7pWZIXs21NW7xObuC1JuQZD1g
	 Jh0hwVw9en8yuOAe32im+vxH/EFqLFKbEPMPGAhXeGjH8/VC2CLORlYDbzDGzOXSnv
	 8GMUPK7nxczSg/LqNlTqFbBDqklCnvsd232VMNtWxFHsjB90mg6Efu4IMfrRQiwmdi
	 KpzptJyZJvf8WzfkXvJIiOyTKSt3smkg7K2GnlZacL/37cvWrt1eEMPQbn40j9y/E/
	 suXLPWzbDtEMg==
Date: Tue, 3 Nov 2026 10:09:17 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <ebhzyg5ypdes5vmh7z4tfe7wngbra7jmilfizhs3rprigfjshq@hefxoxdebp5h>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
 <aumbOqMXf-uWmGOx@QCOM-aGQu4IUr3Y>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aumbOqMXf-uWmGOx@QCOM-aGQu4IUr3Y>

On Tue, Nov 03, 2026 at 04:28:42PM +0800, Shawn Guo wrote:
> On Fri, Oct 30, 2026 at 10:28:21AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> > > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > > 
> > > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > > AMUX thermistor pins are wired up, so none of the board thermistor
> > > rails feed the thermal framework.
> > > 
> > > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > > thermistors, so add only these 3 channels.
> > > 
> > > Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> > > a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> > > and a per-channel thermal-zone for each, following the existing
> > > Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> > > ADC channel.
> > > 
> > > Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > 
> > ...
> > 
> > > +
> > >  		pmau0102_f_thermal: pmau0102-f-thermal {
> > >  			polling-delay-passive = <100>;
> > >  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> > > @@ -501,6 +545,42 @@ trip0 {
> > >  			};
> > >  		};
> > >  
> > > +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
> > 
> > Existing thermal zone nodes use the "pmau0102" prefix.
> 
> Hi Bartosz,
> 
> Following up on this: "pmau0102-e-sdram3-thermal" exceeds the
> thermal-zones.yaml node name limit (11 chars before "-thermal").
> Since v2 moves these zones into the board DTs per Konrad's comment,
> I will name them after the measured component, i.e. sdram3-thermal,
> sdram1-thermal and ufs-thermal, like other boards do. I will drop
> your Acked-by in v2 as the patch changes quite a bit.
>

Sounds good!

Thanks,
Bartosz
