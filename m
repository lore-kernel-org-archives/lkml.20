Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74944D4897
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557139; cv=none; b=ItylvWkhby4Dj9yTZj8GZh95CJQiHPSNVWluR8eI/qo/oHGcIW7iJCBQBTjfspqa22SxF19MkDOTKXzKdI0qyMlN5HpHgUOyzKH24pKmq1PxN2ivCDG2EAxrvtv4XCn9Fs/roOiSzvAE5hE6pjnk/WPQoBuoa4XstxzD/6PqCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557139; c=relaxed/simple;
	bh=6NoH5ngXlboK+4ycuUT1H4GT+20zyFS5Vw8rwawIAd8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m3EAZPWB5EohBYJvDXlkRirzlCHiP5mUzSGZJAa7ML7/MbJSc7EW7k0Msr5HEXgp17t8l5uWAMT5BmqSFk4DBiEvnERn2LCkN+BKpxfhKcERzHBRzPyliKS7iHdKAym+Y6FFh4nTo7t6wHkCe8pUIrHvUeeX75RmX3z88EtNPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AGZuqFUq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AGZuqFUq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6NoH5ngXlboK+4ycuUT1H4GT+20zyFS5Vw8rwawIAd8=; b=AGZuqFUqUY3ucm+mZxhBynIqW9
	Dhtwp+YxZEaBaRK7MARWfcNbp2lZcZXYGIdsEcZc3ElptOLHbPKYfNSgFCGavzyGT9455qERCJFyo
	9rRqzN8lcJanyAeMOTCTEpBspv35VrB4S+FHuNo5fUvacDxnzP1jTk124qRrmHuvhYcSp9Em4lN71
	DLhy8UEnM57XIOAxsCwM+vOHZAjf7U8vmhsIMwYbk+vsdigoOiys0GOGTo4M2HJ8agipO04KETW0U
	bdNVYBxPKOrySKXqbw2FcT1pCkx4hSJ9eplKQB57FGtdBm4GhCS1Imovr848vmWvpabn6Gvx1bSjv
	qVQZGPYQ==;
Received: from [54.239.6.187] (helo=u09cd745991455d.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBqj-0000000FQnr-2W43;
	Fri, 09 Oct 2026 14:45:29 +0000
Message-ID: <b5c72d9c3812d3b4988353e842d736694fc9258d.camel@infradead.org>
Subject: Re: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
From: David Woodhouse <dwmw2@infradead.org>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Pasha Tatashin	
 <pasha.tatashin@soleen.com>, Luka Absandze <absandze@amazon.de>, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi	 <lpieralisi@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Mark Rutland	 <mark.rutland@arm.com>, Peter Zijlstra
 <peterz@infradead.org>, Marc Zyngier	 <maz@kernel.org>
Date: Fri, 09 Oct 2026 15:45:28 +0100
In-Reply-To: <asjLE0VkeVJKA554@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
	 <f1ab0c03257d5055ada02877ac92a06f370c72b9.camel@infradead.org>
	 <asjLE0VkeVJKA554@willie-the-truck>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-gSzyXEnfOVhoIAEWfRS4"
User-Agent: Evolution 3.62.0-0ubuntu1~ppa1~24.04 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-gSzyXEnfOVhoIAEWfRS4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-10-09 at 12:08 +0100, Will Deacon wrote:
> Hi David,
>=20
> Thanks for replying with so much data! It looks like I sent my v2 out
> at the same time.

Yeah. I'm redoing the full set of tests on that, along with the
spinwait variant.

> On Fri, Oct 09, 2026 at 11:00:08AM +0100, David Woodhouse wrote:
> > Thanks both of you for working on this. It was always on my list to
> > come back and do it for arm64, but that list is long. Also on my list
> > FWIW is parallelising the *later* stages of CPU hotplug=C2=B9, not just=
 the
> > early path into start_secondary()/secondary_start_kernel(). IIRC there
> > was more win to be had, but we had to prove that a lot of once-
> > serialized code could safely run concurrently. Ideally without just
> > na=C3=AFvely adding locking and serializing it all again.
>=20
> That gets _really_ hard because you need RCU up and running pretty early.

RCU should be OK, as long as a CPU which is registered doesn't *then*
block in a spin-wait, like the traditional CPU hotplug machinery does.

> > I gave your series a quick spin across a range of EC2 systems, and it
> > gives a ~40% win on systems with 192 cores =E2=80=94 at least, as a
> > microbenchmark of the CPU onlining. For these systems, PSCI is fairly
> > fast to bring the CPUs online and it isn't a huge proportion of the
> > *overall* kexec time.
> >=20
> > However, your code in serial mode (cpuhp.parallel=3D0) is up to 40%
> > *slower* than before. A/B testing results, all values in milliseconds:
>=20
> Oh, that's unexpected.
> ...

> Would it be possible for you to pick one of these platforms and bisect
> the serial regression, please? I'm not really sure where to look, but
> serial boot should work all the way through the series so if you can
> identify the point at which it regresses (and presumably doesn't recover)
> then that would hopefully point me in the right direction. One possibilit=
y
> is that the extra atomics in the new state machine logic are slowing thin=
gs
> down. Another possibility is the timeout logic in
> cpuhp_wait_for_sync_state() ends up sleeping in your tests.

Looks like the latter, falling back to usleep_range(1000, 2000). Goes
away if you make it atomic_cond_read_relaxed():
https://git.infradead.org/?p=3Dusers/dwmw2/linux.git;a=3Dcommitdiff;h=3Dcba=
8bdecff74

Of course, if we weren't synchronously *waiting* for the APs and they
just turned up later, the world would be a better place. And the ones
with slow firmware wouldn't matter either.

Unless we're actually doing parallel initcalls, we don't even *need*
the secondary CPUs until much later, do we?

> Probably worth using my v2 just in case one of the fixes there helps,
> but I'm not hopeful.
>=20
> > We also tried it on another system where the firmware takes about 9ms
> > to bring each CPU up (after CPU_ON returns fairly quickly). Fanning out
> > the CPU_ON calls didn't make any difference either; the CPUs came
> > online, one at a time, about 9ms apart.=C2=A0The parallel onlining save=
d
> > only about 20ms out of 820ms (=E2=86=92800ms) here.
>=20
> Damn, I guess the firmware has some serialisation in that case?

$DEITY knows, but I guess so. We don't get to write the firmware for
those ones, AIUI.

> > The real answer for such platforms (at least for kexec) is *not* to do
> > the CPU_OFF/CPU_ON thing at all. Pasha's Caretaker work=C2=B2 still doe=
s so
> > for the reclaim at hotplug time in the next kernel; I'm experimenting
> > with eliding that, which should give the biggest improvement on such
> > platforms. So during kexec the APs just spin and wait to be asked to
> > come back, instead of going completely offline.
>=20
> I was talking to Tarun about that at LPC. I was envisaging a form of
> CPU_OFF that would leave the MMU enabled so we could make use of the
> existing EFI boot logic, but I hadn't thought about it beyond that.

I think it ties closely into the caretaker thing. We don't take the CPU
offline at all (no firmware, no CPU_OFF of any kind). Instead, we just
leave it parked somewhere.

The first stage is leaving it parked and just spinning waiting to come
back. Which is all we care about here.

The next stages involve making it do useful *work* instead of just
spinning. Like Pasha's KVM vCPU caretaker, and the thing I'm working on
which runs a minimal C runtime driving an e1000 through VFIO,
transitioning onto bare metal on the "offline" CPUs across kexec, then
back to running in a Linux thread after kexec. All in QEMU while being
flood-pinged from the host across the kexec.


--=-gSzyXEnfOVhoIAEWfRS4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
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
Ln0hu5HyOG98bRzoOX8R8XkAAAAAAAA=


--=-gSzyXEnfOVhoIAEWfRS4--
